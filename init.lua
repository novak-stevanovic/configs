vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd [[set termguicolors]]
vim.g.mapleader = " "
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("config.keybinds")
require("config.lazy")

vim.opt.cursorline = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"
vim.o.guicursor = "a:blinkon0"
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.virtualedit = "block"

vim.opt.wrap = false

vim.opt.scrolloff = 8

