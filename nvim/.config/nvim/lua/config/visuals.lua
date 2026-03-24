vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.cmd.colorscheme "catppuccin"

local sev = vim.diagnostic.severity
vim.diagnostic.config {
  signs = { text = { [sev.ERROR] = "󰅙", [sev.WARN] = "", [sev.INFO] = "󰋼", [sev.HINT] = "󰌵" } },
  float = {
    header = false,
    border = "rounded",
    focusable = true,
  }
}

