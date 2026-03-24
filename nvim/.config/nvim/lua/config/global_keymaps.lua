local s = vim.keymap.set
s("i", "kj", "<ESC>", {desc = "Normal mode"})
s("n", "<C-s>", "<cmd>w<CR>", {desc = "Save file"})
s({"n", "v"}, "gh", "^", {desc = "To the begining"} )
s({"n", "v"}, "gl", "$", {desc = "To the end"} )
s("x", "<leader>p", "'_dP", {desc = "Preserving paste"})
s("n", "]<leader>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {silent = true, desc = "New back line"})
s("n", "[<leader>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {silent = true, desc = "New forward line"})
