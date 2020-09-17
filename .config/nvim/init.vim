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
Plug 'artanikin/vim-synthwave84'
Plug 'srcery-colors/srcery-vim'

"navigation
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'

"others
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"language
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'leafgarland/typescript-vim'

"markdown
Plug 'junegunn/goyo.vim'
Plug 'masukomi/vim-markdown-folding'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'

call plug#end()

"theme
syntax enable
colorscheme srcery
let g:lightline = { 'colorscheme': 'srcery' }
set termguicolors
set noerrorbells
set background=dark
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set rnu
set nowrap
set noshowmode
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

let mapleader = " "

let g:typescript_compiler_binary = 'npx tsc'
let g:vim_svelte_plugin_use_typescript=1

" lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.gopls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.clangd.setup{ cmd={"clangd-9", "--background-index"}, on_attach=require'completion'.on_attach }

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>

"remappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
noremap <leader>/ :Commentary<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>; :tabnext <CR>
nnoremap <leader>a :tabpre <CR>

"nerdtree
nnoremap <leader>u :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

"set nerdtree minimal
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

"fzf setup
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
" Do fzf within files without reading filenames
command! -bang -nargs=* Rg call fzf#vim#grep("rg --ignore --line-number --column --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" source ~/.config/nvim/coc.vim
