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

-- If an error message is scrolled off the edge of the screen, hit <leader>e to open it in all it's glory
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Show white space by hitting <leader>l
vim.api.nvim_set_keymap("n", "<leader>l", ":set list!<CR>", { noremap = true, silent = true })

-- Yank to clipboard so I can paste into something not nvim
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })

vim.filetype.add({
  extension = { slim = "slim" },
})

-- Handlebars special case syntax highlighting
vim.filetype.add({
  extension = {
    hbs = "html", -- This will use HTML highlighting
  },
})

-- Autocommand to run npx prettier on save for JavaScript files
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.prisma",
--   callback = function()
--     vim.cmd("!npx prisma format")
--   end,
-- })

-- ReloadConfig command for reloading all nvim configuration
-- This isn't supported by lazy.nvim, hence why it's commented out.
-- vim.api.nvim_create_user_command("ReloadConfig", "luafile $MYVIMRC", {})
