local vim = vim

vim.g.mapleader = ' '

require('plugins')
require('keymap')

local opt = vim.o

local indent = 4

opt.termguicolors = true
opt.scrolloff = 10
opt.number = true
opt.splitbelow = true
opt.wrap = false
opt.background = 'dark'
opt.tabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
opt.shortmess = opt.shortmess .. 'c'
opt.completeopt = 'menuone,noinsert,noselect'
opt.mouse = 'a'
opt.laststatus = 3
opt.ignorecase = true;
opt.smartcase = true;
opt.undofile = true;

opt.updatetime = 250
opt.timeoutlen = 300

vim.opt.splitright = true;
vim.opt.splitbelow = true;
vim.opt.cursorline = true;

vim.opt.list = true;
vim.opt.listchars = {
    tab = '» ',
    trail = '.',
    nbsp = '␣'
}

vim.g.netrw_winsize = 25

local colorscheme = 'onedark_vivid'

if math.random(100) % 2 == 0 then
    colorscheme = 'tokyonight'
end

vim.cmd(string.format('colorscheme %s', colorscheme))

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
