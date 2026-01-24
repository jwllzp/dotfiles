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
				functions = { bold = true },
				keywords = { bold = true },
				comments = {},
				strings = {},
				constants = { bold = true }, -- includes numbers, booleans
			},
			colors = {},
			on_highlights = function(hl, c) end,
		})
		vim.cmd.colorscheme("koda")
	end,
}
