return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local function opts(desc)
          return { buffer = ev.bufnr, desc = "LSP " .. desc }
        end
        local map = vim.keymap.set
        map("n", "K", vim.lsp.buf.hover, opts "hover" )
        map("n", "gK", vim.lsp.buf.signature_help, opts "signature help")
        map("n", "gD", vim.lsp.buf.declaration, opts "go to declaration")
        map("n", "gd", vim.lsp.buf.definition, opts "go to definition")
        map("n", "gi", vim.lsp.buf.implementation, opts "go to implementation")
        map("n", "gy", vim.lsp.buf.type_definition, opts "go to type definiton")
        map("n", "gr", vim.lsp.buf.references, opts "go to references")
        map("n", "<leader>cr", vim.lsp.buf.rename, opts "rename")
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts "code action")

        require("lsp_signature").on_attach({
          -- ... setup options here ...
        }, ev.bufnr)
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspc = require("lspconfig")

    lspc["pyright"].setup({
      capabilities = capabilities,
    })
  end
}
