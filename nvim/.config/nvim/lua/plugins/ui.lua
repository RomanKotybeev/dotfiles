return {
  -- ========================= TELESCOPE ==========================
  {
    "nvim-telescope/telescope.nvim",
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
          file_ignore_patterns = {
            "%.jpg", "%.png", "%.pdf", "%.zip"
          },
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
}
