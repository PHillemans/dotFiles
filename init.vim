lua require('init')

autocmd BufWritePost plugins.lua PackerCompile

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>; :tabnext<CR>
nnoremap <leader>a :tabpre<CR>

tnoremap <Esc> <C-\><C-n>


nnoremap nc <cmd>Telescope colorscheme<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-o> <cmd>Telescope colorscheme<cr>

nnoremap <leader>u :Lex<CR><CR>
