local s = vim.keymap.set
s("i", "kj", "<ESC>", {desc = "Normal mode"})
s("n", "<C-s>", "<cmd>w<CR>", {desc = "Save file"})
s({"n", "v"}, "gh", "^", {desc = "To the begining"} )
s({"n", "v"}, "gl", "$", {desc = "To the end"} )
s("x", "<leader>p", "'_dP", {desc = "Preserving paste"})
s("n", "]<leader>", ":set paste<CR>m`o<Esc>``:set nopaste<CR>", {silent = true, desc = "New back line"})
s("n", "[<leader>", ":set paste<CR>m`O<Esc>``:set nopaste<CR>", {silent = true, desc = "New forward line"})


-- Diagnostics
s(
  "n",
  "<leader>do",
  vim.diagnostic.open_float,
  {desc = "Diagnostics open float (Trouble)"}
)
s("n", "<leader>dt", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })
