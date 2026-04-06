return {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp' },  -- also add cpp while you're at it
  root_markers = {
    '.clangd',
    'compile_commands.json',
    'compile_flags.txt',
    '.git',
  },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
}
