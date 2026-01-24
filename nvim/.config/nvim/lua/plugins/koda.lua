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
			on_highlights = function(hl, c) end,
		})
		vim.cmd.colorscheme("koda")
	end,
}
