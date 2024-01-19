require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'tsx', 'typescript', 'javascript', 'html' },
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true
    }
}
