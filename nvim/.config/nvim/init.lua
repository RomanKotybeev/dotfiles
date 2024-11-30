require("config.lazy")

vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.shiftwidth = 4

vim.opt.undofile = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.hlsearch = false

vim.cmd("filetype indent on")
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.cmd.colorscheme "catppuccin"

-- =========================== Mappings =========================== 
local s = vim.keymap.set
s("i", "kj", "<ESC>", {desc = "Normal mode"})
s("n", "<C-s>", "<cmd>w<CR>", {desc = "Save file"})
s({"n", "v"}, "gh", "^", {desc = "To the begining"} )
s({"n", "v"}, "gl", "$", {desc = "To the end"} )
s("x", "<leader>p", "'_dP", {desc = "Preserving paste"})
s("n", "]<leader>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {silent = true, desc = "New back line"})
s("n", "[<leader>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {silent = true, desc = "New forward line"})


local sev = vim.diagnostic.severity
vim.diagnostic.config {
  signs = { text = { [sev.ERROR] = "󰅙", [sev.WARN] = "", [sev.INFO] = "󰋼", [sev.HINT] = "󰌵" } },
  float = {
    header = false,
    border = "rounded",
    focusable = true,
  }
}
