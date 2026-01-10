return {
	"j-hui/fidget.nvim",
	branch = "main",

	opts = {
		progress = {
			display = { done_icon = "✓" },
		},

		notification = {
			-- Do NOT override vim.notify
			window = {
				normal_hl = "NormalFloat", -- inherit theme floating text
				winblend = 0,
				border = "rounded",
				max_width = 60,
			},
		},
	},

	config = function(_, opts)
		-- Use default theme colors (no custom peach)
		vim.api.nvim_set_hl(0, "FidgetIcon", { link = "NormalFloat" })

		require("fidget").setup(opts)
	end,
}
