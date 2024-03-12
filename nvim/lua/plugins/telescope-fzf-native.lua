return {
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    build = "make",
    config = function()
        require "telescope".load_extension "fzf"
    end
}
