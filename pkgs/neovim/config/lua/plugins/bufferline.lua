return {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    dependencies = {
        "echasnovski/mini.bufremove",
        "nvim-tree/nvim-web-devicons"
    },
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Toggle pin" },
    },
    opts = {
        options = {
            close_command = "lua MiniBufremove.delete(%d)",
            right_mouse_command = "lua MiniBufremove.delete(%d)",
            diagnostics = "nvim_lsp",
            -- no_italic
            style_preset = 4,
            indicator = { style = "underline" },
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
        },
    },
}
