local lsp = require 'lspconfig'

require "mason".setup()
require "mason-lspconfig".setup {
    ensure_installed = { "lua_ls", "omnisharp", "tsserver", "eslint", "svelte" }
}

require("neodev").setup({})

local on_attach = function(_, bufnr)
    print('attached to buffer', bufnr)
    -- Enable completion triggered by <c-x><c-o>
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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<CR>', opts)
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
    gopls = {},
    zls = {},
    pyright = {},
    tailwindcss = {},
    yamlls = {
        settings = {
            yaml = {
                schemas = {
                    ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "/*.gitlab-ci.yml"
                }
            }
        }
    },
    tsserver = {},
    rust_analyzer = {
        cmd = { "rustup", "run", "stable", "rust-analyzer" },
        checkOnSave = {
            command = "clippy"
        }
    },
    eslint = {},
    omnisharp = {},
    svelte = {},
    emmet_language_server = {},
    lua_ls = {
        settings = {
            Lua = {
                completion = {
                    callSnippit = "Replace"
                }
            }
        },
        n_init = function(client)
            local path = client.workspace_folders[1].name
            if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                })

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
            end
            return true
        end
    }
}

vim
    .iter(servers)
    :map(
        function(server, config)
            lsp[server].setup(
                vim.tbl_extend(
                    'keep',
                    config,
                    {
                        on_attach = on_attach,
                        capabilities = capabilities
                    }
                )
            )
        end
    ):totable()
