return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local s = vim.keymap.set
        s("n", "K", vim.lsp.buf.hover, opts)
        s("n", "gK", vim.lsp.buf.signature_help, opts)
        s("n", "gD", vim.lsp.buf.declaration, opts)
        s("n", "gd", vim.lsp.buf.definition, opts)
        s("n", "gi", vim.lsp.buf.implementation, opts)
        s("n", "gy", vim.lsp.buf.type_definition, opts)
        s("n", "gr", vim.lsp.buf.references, opts)
        s("n", "<leader>do", vim.diagnostic.open_float, opts)
        s("n", "<leader>cr", vim.lsp.buf.rename, opts)
        s("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspc = require("lspconfig")

    lspc["pyright"].setup({
      capabilities = capabilities,
    })
  end
}
