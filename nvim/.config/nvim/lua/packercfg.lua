return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- Appereance
    use 'ntk148v/komau.vim'
    use 'EdenEast/nightfox.nvim'
    use 'pgdouyon/vim-yin-yang'
    use 'sainnhe/everforest'
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
    }
    use 'ellisonleao/gruvbox.nvim'
    use 'folke/tokyonight.nvim'
    use 'svrana/neosolarized.nvim'
    use 'rakr/vim-one'
    use 'catppuccin/nvim'
    use 'tjdevries/colorbuddy.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani41/nvim-web-devicons', opt = true }
    }
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
    use 'lukas-reineke/indent-blankline.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use 'nvim-treesitter/nvim-treesitter'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'

    -- Tools
    use 'windwp/nvim-autopairs'
    use 'kylechui/nvim-surround'
    use 'tpope/vim-rsi'

    -- Git
    use 'kdheepak/lazygit.nvim'
    use 'lewis6991/gitsigns.nvim'
end)
