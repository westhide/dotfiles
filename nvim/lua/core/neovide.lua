if vim.g.neovide then
    for key, val in pairs
    {
        neovide_cursor_animate_command_line = false,
    }
    do vim.g[key] = val end
end
