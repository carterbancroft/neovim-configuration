-- Provides snippet functionality for all major languages. Kind of confusing
-- though.
return {
  {
    -- Provides snippets directly from the language server in addition to
    -- LuaSnip snippets.
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- The completion engine for luasnip. This is the thing that completes
      -- a snippet when you select one from the completion window.
      -- https://github.com/saadparwaiz1/cmp_luasnip
      "saadparwaiz1/cmp_luasnip",
      -- VSCode-like snippets. This provides the actual code snippets.
      -- https://github.com/rafamadriz/friendly-snippets
      "rafamadriz/friendly-snippets",
    },
  },
  {
    -- This is the basically plugin that renders the window for autocompletions
    -- https://github.com/hrsh7th/nvim-cmp
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")

      -- Handles loading the actual snippets supplied by friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            -- Handles expanding snippets
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}
