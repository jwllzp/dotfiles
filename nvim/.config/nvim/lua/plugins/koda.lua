return {
	"oskarnurm/koda.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("koda").setup({
			transparent = true,
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
				hl.RainbowDelimiter1 = { fg = "#ffd700" }
				hl.RainbowDelimiter2 = { fg = "#da70d6" }
				hl.RainbowDelimiter3 = { fg = "#179fff" }
			end,
		})
		vim.cmd.colorscheme("koda")
	end,
}
