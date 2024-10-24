return {
    "ton/vim-bufsurf",
    config = function()
        Map("n", "]b", ":silent BufSurfForward<CR>", Opts)
        Map("n", "[b", ":silent BufSurfBack<CR>", Opts)
        Map("n", "[B", ":BufSurfList<CR>", Opts)
    end
}
