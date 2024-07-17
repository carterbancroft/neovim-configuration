-- I mostly use this for better syntax highlighting and indentation
-- https://github.com/nvim-treesitter/nvim-treesitter
--
-- prisma syntax highlighting is not supported. Prisma highlighting is handled
-- via vim-prisma.lua.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "javascript", "python", "html", "css", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
