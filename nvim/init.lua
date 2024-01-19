local vim = vim

vim.g.mapleader = ' '

require('plugins')
require('lsp-config')
require('ts-config')
require('tele-config')
require('keymap')
local lualine = require('lualine').setup{
    options = {
        icons_enabled = false,
        globalstatus = true
    }
}

require'onedark'.load()

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
globalstatus=true
opt.laststatus = 3

vim.g.netrw_winsize = 25

require('project_nvim').setup{}
