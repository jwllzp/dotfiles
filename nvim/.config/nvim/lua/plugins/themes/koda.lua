vim.pack.add({
	"https://github.com/oskarnurm/koda.nvim",
})

require("koda").setup({
	theme = {
		dark = "dark",
		light = "light",
	},
	transparent = true,
	auto = true,
	cache = true,
	styles = {
		functions = { bold = false },
		keywords = { bold = false },
		comments = { bold = false },
		strings = { bold = false },
		constants = { bold = false }, -- includes numbers, booleans
	},
	colors = {},
	on_highlights = function(hl, _) end,
})
vim.cmd.colorscheme("koda")
