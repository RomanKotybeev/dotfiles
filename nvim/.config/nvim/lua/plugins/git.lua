return {
  -- ========================= Gitsigns ===========================
  {
    "lewis6991/gitsigns.nvim",
    config = function(_, opts)
      require('gitsigns').setup({
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          map('n', '<leader>gs', gitsigns.stage_hunk, {desc = "Gitsigns stage hunk"})
          map('n', '<leader>gr', gitsigns.reset_hunk, {desc = "Gitsigns reset hunk"})
          map('n', '<leader>gS', gitsigns.stage_buffer, {desc = "Gitsigns stage buffer"})
          map('n', '<leader>gu', gitsigns.undo_stage_hunk, {desc = "Gitsigns undo stage hunk"})
          map('n', '<leader>gR', gitsigns.reset_buffer, {desc = "Gitsigns reset buffer"})
          map('n', '<leader>gp', gitsigns.preview_hunk, {desc = "Gitsigns preview hunk"})
          map('n', '<leader>gP', gitsigns.preview_hunk_inline, {desc = "Gitsigns preview hunk inline"})
          map('n', '<leader>gb', function() gitsigns.blame_line{full=true} end, {desc = "Gitsigns blame line"})
          map('n', '<leader>gt', gitsigns.toggle_current_line_blame, {desc = "Gitsigns toggle blame"})
          map('n', '<leader>gd', gitsigns.diffthis, {desc = "Gitsigns diff"})
          map('n', '<leader>ge', gitsigns.toggle_deleted, {desc = "Gitsigns show deleted"})
        end,
      })
    end,
  },
  -- =========================== END ==============================
  -- ========================= LazyGit ============================
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  -- =========================== END ==============================
}
