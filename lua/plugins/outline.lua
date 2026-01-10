return {
	"hedyhli/outline.nvim",

	-- Lazy-load on demand
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle Outline" },
	},

	config = function()
		require("outline").setup({

			-- Prefer LSP symbols, fallback to Tree-sitter (great for JS/TS/JSX)
			providers = {
				priority = { "lsp", "treesitter" },
			},

			-- VS Code–like auto-follow
			outline_items = {
				auto_update_events = {
					follow = { "CursorMoved" },
					refresh = { "BufEnter", "BufWritePost" },
				},
				show_symbol_details = true,
				show_symbol_lineno = true,
			},

			-- Clean, smart folding
			symbol_folding = {
				autofold_depth = 1,
				auto_unfold = {
					hovered = true,
				},
			},

			-- Window behavior (VS Code style)
			outline_window = {
				position = "right",
				width = 32,
				focus_on_open = false, -- don’t steal focus
				show_cursorline = true,
				hide_cursor = true,
			},

			-- Preview symbols without jumping
			preview_window = {
				auto_preview = true,
				live = false,
			},

			-- Icons (uses lspkind if installed)
			symbols = {
				icon_source = "lspkind",
			},
		})
	end,
}
