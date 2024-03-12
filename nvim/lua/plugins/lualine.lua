return {
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    opts = {
        options = {
            globalstatus = true,
            component_separators = "|",
        },
        extensions = { "lazy", "nvim-tree" },
    },
}
