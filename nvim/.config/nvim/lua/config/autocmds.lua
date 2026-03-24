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

vim.lsp.enable({"pyright"})
