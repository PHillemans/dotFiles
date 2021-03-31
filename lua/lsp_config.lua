local lspconfig = require('lspconfig')
local nlua = require('nlua.lsp.nvim')
local util = require('lspconfig.util')
local completion = require('completion')

local sumneko_root = '/Users/pepijnhillemans/Downloads/source/lua-language-server/'
local sumneko_binary = sumneko_root .. '/bin/macOS/lua-language-server'

local omnisharp_bin = '/Users/pepijnhillemans/Downloads/source/omnisharp-osx/run'
local pid = vim.fn.getpid()

local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'ca', '<cmd>Telescope lsp_code_actions<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', {noremap = true})

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  completion.on_attach(client)
end

nlua.setup(lspconfig, {
  cmd = {sumneko_binary, "-E", sumneko_root .. "/main.lua"};
  on_attach = custom_lsp_attach
})

lspconfig.pyls.setup{on_attach = custom_lsp_attach}
lspconfig.gopls.setup{on_attach = custom_lsp_attach}
lspconfig.vuels.setup{on_attach = custom_lsp_attach, util.root_pattern("package.json", "tsconfig.json", ".git") or vim.loop.cwd();}
lspconfig.tsserver.setup{on_attach = custom_lsp_attach}
lspconfig.svelte.setup{on_attach = custom_lsp_attach}
lspconfig.omnisharp.setup{
    cmd = {omnisharp_bin, '--languageserver', '--hostPID', tostring(pid)},
    on_attach = custom_lsp_attach
}
