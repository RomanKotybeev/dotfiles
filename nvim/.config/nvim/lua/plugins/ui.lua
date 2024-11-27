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
    --event = "User FilePost",
    opts = {
      indent = { char = "│" },
      scope = { char = "│" },
    },
  },
  -- =========================== END ==============================
  -- ========================= TROUBLE ============================
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>dT",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>dt",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      }, {
        "<leader>ds",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>dS",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>dl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>dq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- =========================== END ==============================
  -- ========================= LUALINE ============================
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      local ll = require("lualine")
      ll.setup({
        options = {
          icons_enabled = true,
          theme = "nightfly",
          component_separators = { left = "", right = ""},
          section_separators = { left = "", right = ""},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = false,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff", "diagnostics"},
          lualine_c = {"filename"},
          lualine_x = {"filetype"},
          lualine_y = {},
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
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end,
  },
  -- =========================== END ==============================
}
