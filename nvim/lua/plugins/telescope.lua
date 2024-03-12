return {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    },
    opts = {
        defaults = {
            prompt_prefix = "🔍 ",
            selection_caret = " ",
            path_display = { "smart" },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
}
