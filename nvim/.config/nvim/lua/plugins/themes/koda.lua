vim.pack.add({
	"https://github.com/oskarnurm/koda.nvim",
})

require("koda").setup({
	theme = {
		dark = "dark",
		light = "light",
	},
	transparent = false,
	auto = true,
	cache = true,
	styles = {
		functions = {},
		keywords = {},
		comments = {},
		strings = {},
		constants = {}, -- includes numbers, booleans
	},
	colors = {},
	on_highlights = function(hl, _)
		hl.RainbowDelimiter1 = { fg = "#da70d6" }
		hl.RainbowDelimiter2 = { fg = "#179fff" }
		hl.RainbowDelimiter3 = { fg = "#ffd700" }
	end,
})
vim.cmd.colorscheme("koda")
