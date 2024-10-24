vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd [[set termguicolors]]
vim.g.mapleader = " "

require("config.keybinds")
require("config.lazy")

-- vim.cmd [[ set autochdir ]] TELESCOPE ISSUES

vim.opt.wildmenu = true
vim.cmd [[ set wildmode=list:full ]]
vim.cmd [[ set path=** ]]

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.o.guicursor = "a:blinkon0"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.virtualedit = "block"

vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.opt.inccommand = 'split'

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
