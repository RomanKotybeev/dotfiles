require('packercfg')
require('neovide')
require('barbar')
require('luasnip.loaders.from_lua').lazy_load()

------------ System --------------------
vim.opt.clipboard = 'unnamedplus'
vim.cmd('filetype indent on')
vim.opt.undofile = true

------------ Appearance ----------------
-- Gui
vim.opt.guifont = {'Iosevka Curly', ':h10'}
vim.opt.termguicolors = true

require('rose-pine').setup({
  disable_italics = true,
})

--vim.cmd('colorscheme gruvbox')
vim.opt.background = 'dark'
--vim.cmd('let ayucolor="light"')
vim.opt.hlsearch = false
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")
require("colorbuddy").colorscheme("basic_black")

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

------------- Mappings ----------------
-- General
vim.g.mapleader = ' '

vim.keymap.set('n', 'gh', '^')
vim.keymap.set('n', 'gl', '$')
vim.keymap.set('n', 'mm', '%')

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set({'n', 'v', 'x'}, '+', '<C-a>')
vim.keymap.set({'n', 'v', 'x'}, '-', '<C-x>')

vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('i', '<C-e>', '<C-o>$')
vim.keymap.set('i', '<C-a>', '<C-o>^')
vim.keymap.set(
	'n',
	']<leader>',
	':set paste<CR>m`o<Esc>``:set nopaste<CR>',
	{silent = true}
)

vim.keymap.set(
	'n',
	'[<leader>',
	':set paste<CR>m`O<Esc>``:set nopaste<CR>',
	{silent = true}
)

vim.keymap.set('n', '<leader>w', '<C-w>')
vim.keymap.set('n', '<leader>fs', ':w<CR>')

-- Telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.lsp_document_symbols, {})

-- nvim-autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
  map_cr = true
})

-- nvim-cmp ---
local cmp = require('cmp')
cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
})


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local handlers = require('nvim-autopairs.completion.handlers')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- nvim-surround
require("nvim-surround").setup({})

----- LSP ----
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
	capabilities = capabilities,
	autostart = true,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = false,
			}
		}
	}
}
require('lspconfig').clangd.setup{}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require'nvim-treesitter.configs'.setup {
  sync_install = false,
  highlight = {
    enable = true,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    additional_vim_regex_highlighting = false,
  },
}

local ls = require "luasnip"

ls.config.set_config {
  history = false,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = false,
}

vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("n", "<space><space>c", "<cmd>source ~/.config/nvim/lua/snip.lua<CR>")

require('gitsigns').setup()

vim.opt.list = true
vim.opt.listchars:append({ trail = '⋅', extends = '⟩', precedes = '⟨' })
