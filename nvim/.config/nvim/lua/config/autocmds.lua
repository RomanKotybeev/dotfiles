vim.opt.completeopt = { "menuone", "noselect", "popup" }
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("n", "gd",  vim.lsp.buf.definition,    "LSP go to definition")
    map("n", "gD",  vim.lsp.buf.declaration,   "LSP go to declaration")
    map("n", "K",   vim.lsp.buf.hover,         "LSP hover")
  end,
})

vim.lsp.enable({"pyright", "clang"})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "python" },
  callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "default",
  callback = function()
    -- Language specific
    -- Clang
    vim.api.nvim_set_hl(0, "@lsp.type.class.c", { link = "@type.builtin.c" })
    vim.api.nvim_set_hl(0, "@lsp.type.enum.c", { link = "@type.builtin.c" })
    -- Status line
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'NvimLightGrey2', bg = 'NvimDarkGrey3' })
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
  end,
})

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function()
    vim.o.statusline = "%!v:lua.require'config.statusline'.statusline()"
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  callback = function()
    vim.wo.statusline = "%!v:lua.require'config.statusline'.statusline_inactive()"
  end,
})
