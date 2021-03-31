vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim', opt = true}

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'

    use 'tpope/vim-commentary'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} 

    use 'hoob3rt/lualine.nvim'

    use 'wfxr/minimap.vim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use 'mhartington/oceanic-next'
    use 'joshdick/onedark.vim'
    use 'arcticicestudio/nord-vim'
    use 'morhetz/gruvbox'
    use 'wadackel/vim-dogrun'
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/edge'
    use 'Th3Whit3Wolf/one-nvim'

    end)
