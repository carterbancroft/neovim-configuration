-- Line numbers
vim.cmd("set number")

-- Tabs are two spaces wide
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")

-- Use spaces when hitting the tab key
vim.cmd("set expandtab")

-- New horizontal splits go below
vim.cmd("set splitbelow")

-- New vertical splits go right
vim.cmd("set splitright")

-- Don't word wrap
vim.cmd("set nowrap")

-- Show a line and column wherever the cursor is
vim.cmd("set cursorline cursorcolumn")

-- Put a marker line at 80 chars out
vim.cmd("set colorcolumn=80")

-- Change the leader key from the default ('\') to space
vim.g.mapleader = " "
