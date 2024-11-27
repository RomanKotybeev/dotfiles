require("config.lazy")

vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.cmd('filetype indent on')

vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.hlsearch = false
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

-- =========================== Mappings =========================== 
local s = vim.keymap.set
s("i", "kj", "<ESC>", {desc = "Normal mode"})
s("n", "<C-s>", "<cmd>w<CR>", {desc = "Save file"})
s({"n", "v"}, "gh", "^", {desc = "To the begining"} )
s({"n", "v"}, "gl", "$", {desc = "To the end"} )
s("x", "<leader>p", "'_dP", {desc = "Preserving paste"})
s("n", "]<leader>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {silent = true, desc = "New back line"})
s("n", "[<leader>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {silent = true, desc = "New forward line"})


vim.diagnostic.config {
  -- signs = true,
  -- underline = true,
  -- virtual_text = false,
  -- virtual_lines = false,
  -- update_in_insert = true,
  float = {
    header = false,
    border = "rounded",
    focusable = true,
  }
}
