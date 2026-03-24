return {
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    branch = "master",
    config = function(_, opts) require'lsp_signature'.setup(opts) end
  },
  {
    "saghen/blink.cmp",
    version = "*", -- use latest release, important for prebuilt binaries
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' },
      },
      appearance = {
        nerd_font_variant = "mono", -- "mono" or "normal"
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      --snippets = { preset = "luasnip" },
      signature = { enabled = true },    -- shows function signature while typing
    },
  },
}
