return {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        ensure_installed = { "c", "cpp", "rust" },
        indent = { enable = true },
    },
}
