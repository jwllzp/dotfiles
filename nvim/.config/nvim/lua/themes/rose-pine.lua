vim.pack.add({
	"https://github.com/rose-pine/neovim",
})

require("rose-pine").setup({
	variant = "auto", -- auto, main, moon, or dawn
	dark_variant = "main", -- main, moon, or dawn
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
		migrations = true, -- Handle deprecated options automatically
	},

	styles = {
		bold = true,
		italic = false,
		transparency = false,
	},

	groups = {},

	palette = {},

	highlight_groups = {},
	before_highlight = function(group, highlight, palette) end,
})
vim.cmd("colorscheme rose-pine")
