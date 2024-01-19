vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'navarasu/onedark.nvim'
    use 'Th3Whit3Wolf/one-nvim'
    use 'olimorris/onedarkpro.nvim'
          
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'nvim-telescope/telescope-file-browser.nvim' }

    use 'nvim-telescope/telescope-ui-select.nvim'

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require'Comment'.setup()
        end
    }

    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("trouble").setup{mode = "document_diagnostics"}
        end
    }

    use 'tpope/vim-fugitive'

    use 'kdheepak/lazygit.nvim'

    use 'numToStr/FTerm.nvim'

    use {
        'ahmedkhalf/project.nvim',
        config = function()
            print('starting project')
            require('project_nvim').setup{
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "package.json" }
            }
        end
    }
end)

