vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- User jk to escape from insert mode
local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)
