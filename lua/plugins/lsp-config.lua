-- This handles all language server communication which allows things like
-- autocomplete, inline warning/error reporting and code actions.
return {
	{
		-- Handles installing and managing language servers.
		-- https://github.com/williamboman/mason.nvim
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- This is mainly used for the ensure_installed prop to make sure language servers
		-- are installed on the system vs having to go through Mason's UI to do it.
		-- https://github.com/williamboman/mason-lspconfig.nvim
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- "cssls",
					-- "dockerls",
					-- "docker_compose_language_service",
					-- "eslint",
					-- "html",
					-- "jsonls",
					"tsserver",
					"pyright",
					-- "sqlls",
				},
			})
		end,
	},
	{
		-- Configures neovim to actually use communicate with language servers.
		-- This is also where you configure key mappings.
		-- https://github.com/neovim/nvim-lspconfig
		"neovim/nvim-lspconfig",
		config = function()
			-- This helps add capabilities to snippet code completion.
			-- cmp_nvim_lsp is required over in the completions.lua plugin.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			-- lspconfig.cssls.setup({})
			-- lspconfig.dockerls.setup({})
			-- lspconfig.docker_compost_language_service.setup({})
			-- lspconfig.eslint.setup({})
			-- lspconfig.html.setup({})
			-- lspconfig.jsonls.setup({})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			--lspconfig.sqlls.setup({})

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
