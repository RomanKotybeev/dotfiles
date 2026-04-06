return {
  -- ========================= TELESCOPE ==========================
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = {"n"}, desc = "Telescope Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", mode = {"n"}, desc = "Telescope Grep (cwd)" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", mode = {"n"}, desc = "Telescope Buffers" },
      { "<leader>ht", "<cmd>Telescope help_tags<CR>", mode = {"n"}, desc = "Telescope Help tags" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", mode = {"n"}, desc = "Telescope Git commits" },
    },
    cmd = "Telescope",
    config = function(_, opts)
      require('telescope').setup({
        defaults = {
          prompt_prefix = "   ",
          selection_caret = " ",
          entry_prefix = " ",
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            width = 0.87,
            height = 0.80,
          },
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
          },
        },
        extensions_list = { "themes", "terms" },
      })
    end
  },
  -- =========================== END ==============================
  -- ======================== TREESITTER ==========================
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "python" }
      },
      ensure_installed = {
        "python",
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- =========================== END ==============================
  -- ===================== INDENT BLANKLINE =======================
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope = { char = "│", highlight = {"NonText"} },
    },
  },
  -- =========================== END ==============================
  -- ========================= TROUBLE ============================
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {"<leader>dT", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)"},
      {"<leader>dt", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      {"<leader>ds", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)"},
      {"<leader>dl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)"},
      {"<leader>dq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)"},
      {"<leader>do", vim.diagnostic.open_float, desc = "Diagnostics open float (Trouble)"}
    },
  },
  -- =========================== END ==============================
  -- ========================= LUALINE ============================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      local ll = require("lualine")
      theme = require('lualine.themes.gruvbox')
      ll.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { },
          section_separators = { },
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {
            "branch", "diff", "diagnostics"
          },
          lualine_c = {"filename"},
          lualine_x = {},
          lualine_y = { 
              {"[[ ]] .. vim.fn.expand('%:p:h:t')",  color = { bg = theme.normal.fg }},
          },
          lualine_z = {"location"}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {"filename"},
          lualine_x = {"location"},
          lualine_y = {},
          lualine_z = {}
        },
      })
    end,
  },
  -- =========================== END ==============================
}
