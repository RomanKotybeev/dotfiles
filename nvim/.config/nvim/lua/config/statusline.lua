local M = {}

local current_branch = ''
local file_watcher = vim.loop.new_fs_event()

local function read_git_head(head_file)
  local f = io.open(head_file)
  if not f then return end
  local HEAD = f:read()
  f:close()
  local branch = HEAD:match('ref: refs/heads/(.+)$')
  current_branch = branch or HEAD:sub(1, 7) -- short commit hash if detached
end

local function watch_head(head_file)
  file_watcher:stop()
  read_git_head(head_file)
  file_watcher:start(head_file, {}, vim.schedule_wrap(function()
    read_git_head(head_file)
    watch_head(head_file)
  end))
end

local function find_git_dir()
  local path = vim.fn.expand('%:p:h')
  while path and path ~= '/' do
    local git_path = path .. '/.git'
    local stat = vim.loop.fs_stat(git_path)
    if stat and stat.type == 'directory' then
      watch_head(git_path .. '/HEAD')
      return
    end
    path = path:match('(.+)/.+$')
  end
  current_branch = ''
  file_watcher:stop()
end

vim.api.nvim_create_autocmd('BufEnter', {
  callback = find_git_dir,
})

local mode_map = {
  ['n']    = 'NORMAL',
  ['no']   = 'O-PENDING',
  ['v']    = 'VISUAL',
  ['V']    = 'V-LINE',
  ['\22']  = 'V-BLOCK',
  ['s']    = 'SELECT',
  ['i']    = 'INSERT',
  ['R']    = 'REPLACE',
  ['Rv']   = 'V-REPLACE',
  ['c']    = 'COMMAND',
  ['t']    = 'TERMINAL',
  ['!']    = 'SHELL',
}

local function mode()
  local m = vim.api.nvim_get_mode().mode
  return mode_map[m] or m
end

local function git()
  if current_branch == '' then return '' end

  local parts = { ' ' .. current_branch }

  local status = vim.b.gitsigns_status_dict
  if status then
    if status.added and status.added > 0 then
      table.insert(parts, '%#StatusLineGitAdded#+' .. status.added)
    end
    if status.changed and status.changed > 0 then
      table.insert(parts, '%#StatusLineGitChanged#~' .. status.changed)
    end
    if status.removed and status.removed > 0 then
      table.insert(parts, '%#StatusLineGitRemoved#-' .. status.removed)
    end
  end

  return '%#StatusLineGit# ' .. table.concat(parts, ' ') .. ' '
end

local function diagnostics()
  local errors   = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local info     = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local hints    = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

  local parts = {}
  if errors   > 0 then table.insert(parts, '%#StatusLineDiagError#E:' .. errors)   end
  if warnings > 0 then table.insert(parts, '%#StatusLineDiagWarn#W:'  .. warnings) end
  if info     > 0 then table.insert(parts, '%#StatusLineDiagInfo#I:'  .. info)     end
  if hints    > 0 then table.insert(parts, '%#StatusLineDiagHint#H:'  .. hints)    end

  if #parts == 0 then return '' end
  return table.concat(parts, ' ') .. ' %#StatusLine#'
end

local function filename()
  local name = vim.fn.expand('%:t')
  local modified = vim.bo.modified and ' [+]' or ''
  return (name ~= '' and name or '[No Name]') .. modified
end

local function dirname()
  return ' ' .. vim.fn.expand('%:p:h:t')
end

function M.statusline()
  return table.concat({
    '%#StatusLineMode# ' .. mode() .. ' ',
    git(),
    '%#StatusLine# ' .. filename(),
    '%=',
    '%#StatusLine# ' .. diagnostics(),
    '%#StatusLineDir# ' .. dirname() .. ' ',
    '%#StatusLinePos# %l:%c ',
  })
end

local function filename_for_win(winid)
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local name = vim.api.nvim_buf_get_name(bufnr)
  local modified = vim.api.nvim_buf_get_option(bufnr, 'modified') and ' [+]' or ''
  return (name ~= '' and vim.fn.fnamemodify(name, ':t') or '[No Name]') .. modified
end

function M.statusline_inactive(winid)
  return table.concat({
    '%#StatusLineNC# ' .. filename_for_win(winid),
  })
end

return M
