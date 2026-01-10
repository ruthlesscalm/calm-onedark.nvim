return {
	-- Plugin: nvim-lspconfig
	-- URL: https://github.com/neovim/nvim-lspconfig
	-- Description: The official plugin for configuring Neovim's built-in LSP client.
	--              (LSP = Language Server Protocol -> The thing that gives you errors, Go To Definition, etc.)
	"neovim/nvim-lspconfig",

	dependencies = {
		-- Mason: A portable package manager for Neovim.
		-- It lets you install Language Servers (Python, Go, TS) without using npm/pip/brew.
		"williamboman/mason.nvim",

		-- Mason-LSPConfig: Bridges Mason and LSPConfig.
		-- It ensures that any server you install via Mason is automatically configured for Neovim.
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		-- =========================================================================
		-- 1. SETUP MASON (The Installer)
		-- =========================================================================
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- =========================================================================
		-- 2. PREPARE CAPABILITIES (Autocomplete)
		-- =========================================================================
		-- By default, Neovim doesn't tell Language Servers that it supports fancy autocompletion.
		-- This line grabs the capabilities from 'nvim-cmp' (your completion plugin)
		-- so that the LSP knows to send completion candidates.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- =========================================================================
		-- 3. KEYBINDINGS (The "on_attach" function)
		-- =========================================================================
		-- This function runs ONLY when a Language Server attaches to a buffer.
		-- e.g. If you open a Python file, 'pyright' attaches, and these keys are set.
		local on_attach = function(client, bufnr)
			-- Helper to shorten keymap calls
			local opts = { buffer = bufnr, silent = true }

			-- VS Code style navigation
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition", buffer = bufnr })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation", buffer = bufnr })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation", buffer = bufnr })

			-- Refactoring
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol", buffer = bufnr })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })

			-- Diagnostics (Error messages)
			vim.keymap.set(
				"n",
				"<leader>d",
				vim.diagnostic.open_float,
				{ desc = "Show Line Diagnostics", buffer = bufnr }
			)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
		end

		-- =========================================================================
		-- 4. SETUP SERVERS (The Magic Loop)
		-- =========================================================================
		require("mason-lspconfig").setup({
			-- List of servers to auto-install if missing.
			-- Add new languages here! (e.g., "gopls", "pyright", "rust_analyzer")
			ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "tailwindcss", "eslint" },

			-- Handlers: This function runs for EVERY server in the list above.
			-- It saves us from writing "lua_ls.setup", "ts_ls.setup", etc. manually.
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						-- Note: If you need specific settings for a language (like disabling a warning),
						-- you can add an 'if server_name == "lua_ls"' block here later.
					})
				end,
			},
		})
	end,
}
