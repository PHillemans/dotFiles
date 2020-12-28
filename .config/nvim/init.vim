call plug#begin('~/.config/nvim/bundle/')

"themes
Plug 'ayu-theme/ayu-vim'
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
Plug 'dracula/vim'
Plug 'norcalli/nvim-colorizer.lua'

"navigation
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

"Git and status
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

"language
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'euclidianAce/BetterLua.vim'

"markdown
Plug 'junegunn/goyo.vim'
Plug 'masukomi/vim-markdown-folding'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'

call plug#end()

"theme
syntax enable
colorscheme horizon
let g:lightline = { 'colorscheme': 'horizon' }
set termguicolors
set noerrorbells
set background=dark
set tabstop=2
set shiftwidth=2
set expandtab
set nornu
set nu
set nowrap

let mapleader = " "

let g:typescript_compiler_binary = 'npx tsc'
let g:vim_svelte_plugin_use_typescript=1

" treesitter
lua require('treesitterconf')


" lsp
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOF
local nvim_lsp = require'lspconfig'
local configs = require'lspconfig/configs'

if not nvim_lsp.sveltels then
    configs.sveltels = {
        default_config = {
            cmd = {"svelteserver", "--stdio"};
            filetypes = {"svelte"};
            root_dir = nvim_lsp.util.root_pattern({"package.json", "svelte.config.js"});
        }
    }
end
nvim_lsp.sveltels.setup{ on_attach = require('completion').on_attach }
EOF
lua require('lspConfig').configure()
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <s-k> <cmd>lua vim.lsp.buf.hover()<CR>

"remappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
noremap <leader>/ :Commentary<CR>

" lua require('plenary.reload').reload_module("telescopeConfig")
nnoremap <C-p> <cmd>lua require'telescopeConfig'.gitfiles()<CR>
nnoremap <C-f> <cmd>lua require'telescopeConfig'.words()<CR>
nnoremap cn <cmd>lua require'telescopeConfig'.editGitfiles()<CR>
nnoremap sf <cmd>lua require'telescopeConfig'.files()<CR>

nnoremap sp <cmd>lua require('telescope.builtin').planets()<CR>

nnoremap <leader>; :tabnext <CR>
nnoremap <leader>a :tabpre <CR>

"nerdtree
nnoremap <leader>u :NERDTreeToggle<CR>
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>

"set nerdtree minimal
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

lua require'colorizer'.setup()
