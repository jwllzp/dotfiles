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
		functions = { bold = false },
		keywords = { bold = false },
		comments = { bold = false },
		strings = { bold = false },
		constants = { bold = false }, -- includes numbers, booleans
	},
	colors = {},
	on_highlights = function(_, _) end,
})
vim.cmd.colorscheme("koda")
