vim.cmd('colorscheme default')

local is_dark = vim.o.background == 'dark'

vim.api.nvim_set_hl(0, "@lsp.type.class.c", { link = "@type.builtin.c" })
vim.api.nvim_set_hl(0, "@lsp.type.enum.c", { link = "@type.builtin.c" })
-- Status line
vim.api.nvim_set_hl(0, 'Normal', {fg = 'NvimLightGrey2', bg = '#2c2c2c' })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'NvimLightGrey2', bg = '#474444' })

vim.api.nvim_set_hl(0, 'StatusLineMode', { fg = 'NvimDarkGrey2', bg = 'NvimLightGreen', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineGit',  { fg = 'NvimLightGrey2', bg = 'NvimDarkGrey4' })
vim.api.nvim_set_hl(0, 'StatusLineDir',  { fg = 'NvimLightGrey2', bg = 'NvimDarkGrey4' })
vim.api.nvim_set_hl(0, 'StatusLinePos',  { fg = 'NvimDarkGrey1', bg = 'NvimLightGreen' })
vim.api.nvim_set_hl(0, 'StatusLineGitAdded',   { fg = 'NvimLightGreen', bg = 'NvimDarkGrey4' })
vim.api.nvim_set_hl(0, 'StatusLineGitChanged', { fg = 'NvimLightYellow', bg = 'NvimDarkGrey4' })
vim.api.nvim_set_hl(0, 'StatusLineGitRemoved', { fg = 'NvimLightRed', bg = 'NvimDarkGrey4' })
vim.api.nvim_set_hl(0, 'StatusLineDiagInfo', { fg = 'NvimLightBlue' })
vim.api.nvim_set_hl(0, 'StatusLineDiagHint',   { fg = 'NvimLightGreen' })
vim.api.nvim_set_hl(0, 'StatusLineDiagWarn', { fg = 'NvimLightYellow' })
vim.api.nvim_set_hl(0, 'StatusLineDiagError', { fg = 'NvimLightRed' })

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function()
    vim.o.statusline = "%!v:lua.require'config.statusline'.statusline()"
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = function()
    if vim.bo.filetype == 'TelescopePrompt' then return end
    local winid = vim.api.nvim_get_current_win()
    vim.wo.statusline = "%!v:lua.require'config.statusline'.statusline_inactive(" .. winid .. ")"
  end,
})

vim.g.colors_name = 'mytheme'
