return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local c = require("cyberdream.colors").default
		require("cyberdream").setup({
			variant = "default",
			transparent = true,
			italic_comments = false,
			hide_fillchars = false,
			borderless_pickers = false,
			terminal_colors = true,
			cache = true,
			extensions = {
				telescope = true,
				notify = true,
				mini = true,
			},
			highlights = {
				Cursor = { reverse = true },
				CursorLineNr = { fg = "#ffffff" },
				FloatBorder = { fg = c.grey },
				Keyword = { fg = "#ffbd5e" },
				PreProc = { fg = c.pink },
				TelescopeBorder = { fg = c.grey },
				TelescopeMatching = { fg = c.pink, bold = true },
				["@keyword.type"] = { fg = "#ffbd5e", italic = false },
				["@spell"] = { fg = c.grey },
				["@string.documentation.python"] = { fg = c.grey },
			},
		})

		vim.cmd.colorscheme("cyberdream")
	end,
}
