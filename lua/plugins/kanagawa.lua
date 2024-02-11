-- This is my colorscheme configuration.
-- https://github.com/rebelot/kanagawa.nvim
return {
  "rebelot/kanagawa.nvim",
  name = "kanagawa",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme kanagawa-wave")
  end,
}
