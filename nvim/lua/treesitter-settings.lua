require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "clojure",
        "html",
        "css",
        "bash",
        "cpp",
        "rust",
        "lua"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}
