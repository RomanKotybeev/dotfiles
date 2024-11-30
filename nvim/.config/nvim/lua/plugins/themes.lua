return {
  {
    "kvrohit/rasmus.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require("catppuccin").setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "frappe",
        },
        styles = {
          comments = {},
          keywords = {},
          conditionals = {},
          miscs = {},
        },
        term_colors = true,
        no_italic = true,
        default_integrations = true,
        integrations = {
          indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
          },
        },
        dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        custom_highlights = function(colors)
          return {
            -- MatchParen = { fg = "#FE640B", bg = "#000000", style = { "bold" } },
            ["@constructor.python"] = { link = "Type" },
            ["@function.builtin.python"] = { link = "Function" },
            ["@constant.python"] = { fg = colors.pink },
            Constant = { link = "@variable.parameter" },
          }
        end,
      })
    end,
  },
}
