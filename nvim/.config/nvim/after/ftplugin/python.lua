-- after/ftplugin/python.lua
print('python ftplugin loaded')

if vim.g.python_indent == nil then
  vim.g.python_indent = {
    open_paren = 'shiftwidth()',
    closed_paren_align_last_line = false,
  }
end
