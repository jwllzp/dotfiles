vim.pack.add({
	"https://github.com/hyperb1iss/silkcircuit",
})

require("silkcircuit").setup({
	transparent = true,
	terminal_colors = true,
	dim_inactive = false,
	variant = "vibrant", -- "neon" | "vibrant" | "soft" | "glow" | "dawn"

	styles = {
		comments = { italic = false },
		keywords = { bold = true },
		functions = { bold = true, italic = false },
		variables = {},
		strings = { italic = false },
	},

	integrations = {},
})

vim.cmd.colorscheme("silkcircuit")
