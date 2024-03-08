local vim = vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    'tpope/vim-sleuth',

    {
        'olimorris/onedarkpro.nvim',
        priority = 1001
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1002,
        opts = {}
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        build = ':TSUpdate',
        config = function()
            require("ts-config")
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        event = "VeryLazy",
        branch = "0.1.x",
        dependencies = {
            'nvim-lua/plenary.nvim',

            'nvim-telescope/telescope-file-browser.nvim',

            'nvim-telescope/telescope-ui-select.nvim',
        },
        config = function()
            require('tele-config')
        end
    },

    {
        "nvim-focus/focus.nvim",
        version = '*',
        config = function()
            require("focus").setup()
        end
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                backdrop = 0.75;
                options = {
                    number = false
                }
            }
        }
    },

    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",

            { 'j-hui/fidget.nvim', opts = {} },

            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            require("lsp-config")
        end
    },

    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',

            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        },
        config = function()
            require'cmp-config'
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            current_line_blame = true
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons', optional = true },
        opts = {
            options = {
                icons_enabled = false,
                globalstatus = true
            }
        }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require 'Comment'.setup()
        end
    },

    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("trouble").setup { mode = "document_diagnostics" }
        end
    },

    {
        'kdheepak/lazygit.nvim',
        keys = {
            { '<leader>lg', ':LazyGit<CR>' }
        }
    },

    {
        'numToStr/FTerm.nvim',
        lazy = true
    },

    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup{}
        end
    }
})
