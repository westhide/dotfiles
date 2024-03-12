for key, args in pairs
{
    -- Lazy
    { "n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" } },

    -- Quit
    { "n", "<c-q>", "<cmd>qa<cr>", { desc = "Quit all" } },

    -- Save file
    { { "i", "v", "n", "s" }, "<c-s>", "<cmd>w<cr><esc>", { desc = "Save file" } },

    -- Window
    { "n", "<leader>-", "<c-w>s", { desc = "Split window below" } },
    { "n", "<leader>|", "<c-w>v", { desc = "Split window right" } },

    -- Window move
    { "n", "<c-h>", "<c-w>h", { desc = "Go to left window" } },
    { "n", "<c-j>", "<c-w>j", { desc = "Go to lower window" } },
    { "n", "<c-k>", "<c-w>k", { desc = "Go to upper window" } },
    { "n", "<c-l>", "<c-w>l", { desc = "Go to right window" } },

    -- Window resize
    { "n", "<c-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" } },
    { "n", "<c-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" } },
    { "n", "<c-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" } },
    { "n", "<c-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" } },

    -- Buffer
    { "n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" } },
    { "n", "<s-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },

    -- Clear search highlight
    { { "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" } },

    -- Better indenting
    { "v", "<", "<gv" },
    { "v", ">", ">gv" },

    -- Terminal Mappings
    { "t", "<esc>", "<cmd>close<cr>", { desc = "Hide Terminal" } },
    { "t", "<c-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" } },
    { "t", "<c-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" } },
    { "t", "<c-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" } },
    { "t", "<c-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" } },
}
do vim.keymap.set(unpack(args)) end
