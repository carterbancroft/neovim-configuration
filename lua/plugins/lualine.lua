-- This is the line at the bottom of the editor that tells things like
-- the mode I'm in, the file name, whether it's been edited, etc.
-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "jellybeans",
      },
    })
  end,
}
