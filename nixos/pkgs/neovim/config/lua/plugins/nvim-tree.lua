return {
    -- https://github.com/nvim-tree/nvim-tree.lua
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer NvimTree" }
    },
    opts = {
        disable_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        filters = { dotfiles = true },
        view = {
            width = { max = 40 },
        },
        renderer = {
            group_empty = true,
            icons = {
                glyphs = {
                    git = {
                        unstaged = "x",
                        untracked = "!",
                    },
                },
            },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        }
    },
}
