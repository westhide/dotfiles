return {
    -- https://github.com/akinsho/toggleterm.nvim
    "akinsho/toggleterm.nvim",
    keys = {
        { "<leader>t", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
        { "<leader>tl", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
        { "<leader>g", [[<cmd>TermExec cmd="lazygit"<cr>]], desc = "Lazygit" },
    },
    opts = {
        direction = "float",
        size = 60,
        float_opts = {
            border = "curved",
        },
    },
}