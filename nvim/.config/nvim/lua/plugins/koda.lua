return {
	"oskarnurm/koda.nvim",
	priority = 1000,
	lazy = false,
	dev = true,
	config = function()
		require("koda").setup({
			transparent = true,
			auto = true,
			cache = false,
			styles = {
				functions = { bold = false },
				keywords = {},
				comments = {},
				strings = {},
				constants = {}, -- includes numbers, booleans
			},
			colors = {},
			on_highlights = function(hl, c)
				hl.RainbowDelimiter1 = { fg = "#da70d6" }
				hl.RainbowDelimiter2 = { fg = "#179fff" }
				hl.RainbowDelimiter3 = { fg = "#ffd700" }
			end,
		})
		vim.cmd.colorscheme("koda")
	end,
}
