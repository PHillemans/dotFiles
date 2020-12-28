local nvim_lsp = require('lspconfig')
local nlua_lsp_nvim = require('nlua.lsp.nvim')
local completion = require('completion')

local M = {}

function M.configure()
  nvim_lsp.cssls.setup{ on_attach=completion.on_attach }
  nvim_lsp.pyls.setup{ on_attach=completion.on_attach }
  nvim_lsp.vuels.setup{ on_attach=completion.on_attach }
  nvim_lsp.tsserver.setup{ on_attach=completion.on_attach }
  nvim_lsp.gopls.setup{ on_attach=completion.on_attach }
  nvim_lsp.clangd.setup{ on_attach=completion.on_attach }
  nvim_lsp.sumneko_lua.setup{ on_attach=completion.on_attach }
  nlua_lsp_nvim.setup(nvim_lsp, {
    on_attach=completion.on_attach,
    globals = {}
  })
end

return M
