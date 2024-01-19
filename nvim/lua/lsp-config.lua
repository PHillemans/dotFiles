local lsp = require'lspconfig'
local pid = vim.fn.getpid()

require"mason".setup()
require"mason-lspconfig".setup{
    ensure_installed = { "lua_ls", "omnisharp", "vuels" }
}

local on_attach = function(client, bufnr)
  print('Starting server '.. bufnr)
    -- print('capabilities', vim.inspect(client.server_capabilities))
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = {
      noremap = true,
      silent = true
  }

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lsp.yamlls.setup {
    filetypes = { "yaml", "yaml.docker-compose", "yml" },
    settings = {
        yaml = {
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/*.gitlab-ci.yml"
            }
        }
    }
}
-- lsp.tsserver.setup {
--     on_attach = on_attach,
--     capabilities = capabilities
-- }
lsp.rust_analyzer.setup {
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    on_attach = on_attach,
    capabilities = capabilities
}
lsp.eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities
}
-- local omnisharp_bin = "/home/pepijnhillemans/OmniSharpMono/OmniSharp.exe"
-- local omnisharp_bll = "/home/pepijnhillemans/OmniSharp6.0/OmniSharp.dll"
-- lsp.omnisharp.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
--     cmd = { "dotnet", omnisharp_bll }
-- }
lsp.omnisharp.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

lsp.angularls.setup{
    on_attach = on_attach
}

lsp.volar.setup{
	on_attach = on_attach,
	capabilities = capabilities,
    filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
    init_options = {
        typescript = {
            tsdk = "/home/pepijnhillemans/.nvm/versions/node/v18.12.1/bin/typescript-language-server"
        }
    }
}

local cmp = require 'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-y>'] = cmp.mapping.confirm({select = true})
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' }
    })
})
