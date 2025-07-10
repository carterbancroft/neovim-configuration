-- Encapsulates linters, formatters, etc.
-- https://github.com/nvimtools/none-ls.nvim
return {
  "nvimtools/none-ls.nvim",
  -- Required for eslint_d
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      -- These are ultimately installed in the Mason UI
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }),

        -- JavaScript
        -- null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint_d"),
        null_ls.builtins.diagnostics.eslint,

        -- Python
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
      },

      -- This handles formatting on save
      -- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })

    -- Call format for the builtin LSP client for neovim. Anything that could
    -- respond to format that's attached to the current buffer will run format
    -- on the current file.
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
