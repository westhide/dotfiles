return {
    -- https://github.com/echasnovski/mini.bufremove
    "echasnovski/mini.bufremove",
    keys = {
        { "<leader>bd", "<cmd>lua MiniBufremove.delete(0)<cr>", desc = "Delete Buffer" },
        { "<leader>bD", "<cmd>lua MiniBufremove.delete(0,true)<cr>", desc = "Delete Buffer (Force)" },
    },
    opts = {},
}
