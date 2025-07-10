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

    -- Note that there is Slim highlighting as well but that's handled in
    -- vim-customization.lua

    config.setup({
      ensure_installed = { "lua", "javascript", "tsx", "python", "html", "css", "bash", "pug" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
