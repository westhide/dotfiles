-- bootstrap lazy.nvim
vim.fn.system {
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
}
