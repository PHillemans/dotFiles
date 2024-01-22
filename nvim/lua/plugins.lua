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
    'wbthomason/packer.nvim',

    'navarasu/onedark.nvim',
    'Th3Whit3Wolf/one-nvim',
    'olimorris/onedarkpro.nvim',
      
    { 'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate' },

    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    'nvim-telescope/telescope-file-browser.nvim',

    'nvim-telescope/telescope-ui-select.nvim',

    {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',

    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', optional = true }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require'Comment'.setup()
        end
    },

    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("trouble").setup{mode = "document_diagnostics"}
        end
    },

    'tpope/vim-fugitive',

    'kdheepak/lazygit.nvim',

    'numToStr/FTerm.nvim',

    {
        'ahmedkhalf/project.nvim',
        config = function()
            print('starting project')
            require('project_nvim').setup{
                detection_methods = { "lsp", "pattern" },
                patterns = { ".git", "package.json" }
            }
        end
    }
})

