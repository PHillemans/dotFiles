require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "lua",
        "c",
        "typescript",
        "javascript",
        "go",
        "python"
    },
    highlight = {
        enable = true,
    }
}

