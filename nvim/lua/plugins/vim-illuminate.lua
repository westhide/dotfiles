return {
    -- https://github.com/RRethy/vim-illuminate
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require "illuminate".configure {
            delay = 200,
        }
    end
}
