call plug#begin('~/.config/nvim/bundle/')

"themes
Plug 'arcticicestudio/nord-vim'                 " Nord theme for vim
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'connorholyday/vim-snazzy'
Plug 'ntk148v/vim-horizon'
Plug 'blerins/flattown'
Plug 'mopp/mopkai.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'

"navigation
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

"others
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'

"language
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"theme
syntax enable
colorscheme edge

set termguicolors
set noerrorbells
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set nowrap

" for CoC
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

let mapleader = " "

"remappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
noremap <leader>/ :Commentary<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg<CR>


"nerdtree
nnoremap <leader>u :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

"set nerdtree minimal
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

source ~/.config/nvim/coc.vim