local vim = vim

-- imports
local lualine = require('lualine')
require('plugins')
require('lsp_config')
require('ts_config')
require('tele_config')

vim.g.mapleader = ' '

local opt = vim.o

local indent = 4

opt.termguicolors = true
opt.scrolloff = 10
opt.number = true
opt.relativenumber = true
opt.incsearch = true
opt.splitbelow = true
opt.wrap = false
opt.background = 'dark'
opt.tabstop = indent
opt.shiftwidth = indent
opt.expandtab = true
opt.shortmess = opt.shortmess .. 'c'
opt.completeopt = 'menuone,noinsert,noselect'
vim.cmd "colorscheme OceanicNext"

vim.g.netrw_winsize = 25

lualine.status()
lualine.theme = 'onedark'
