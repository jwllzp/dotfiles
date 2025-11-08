return {
	"datsfilipe/vesper.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local colors = require("vesper.colors")
		local mix = require("vesper.utils").mix
		require("vesper").setup({
			transparent = true,
			italics = {
				comments = false,
				keywords = false,
				functions = false,
				strings = false,
				variables = false,
			},
			palette_overrides = {
				fg = mix(colors.fg, "#000000", math.abs(0.70)),
				white = mix(colors.white, "#000000", math.abs(0.70)),
				greenLight = colors.red,
				green = colors.redDark,
				red = colors.greenLight,
				comment = mix(colors.comment, "#000000", math.abs(0.45)),
				redDark = colors.green,
			},
			overrides = {
				Boolean = { fg = colors.redDark, bold = true },
				Conditional = { fg = colors.borderDarker, bold = true },
				["@constructor"] = { fg = colors.orange },
				Cursor = { reverse = true },
				CursorLineNr = { bg = "none", bold = true },
				DiagnosticUnderlineError = {},
				DiagnosticVirtualTextError = { fg = colors.hint },
				FloatBorder = { fg = colors.border },
				Number = { fg = colors.white, bold = false },
				NormalFloat = { bg = "none" },
				Statement = { fg = mix(colors.primary, "#000000", 0.60), bold = true },
				Operator = { fg = colors.symbol },
				TelescopeBorder = { fg = colors.border },
				TelescopeMatching = { fg = colors.red, bold = true },
				TelescopeSelection = { bg = colors.fgSelection },
				VertSplit = { fg = colors.border, bg = "none" },
				RainbowDelimiter1 = { fg = "#d79921" },
				RainbowDelimiter2 = { fg = "#b16286" },
				RainbowDelimiter3 = { fg = "#458588" },
				["@spell"] = { fg = colors.comment },
				["@string.documentation.python"] = { fg = colors.comment },
			},
		})
		vim.cmd.colorscheme("vesper")
	end,
}
-- set_hl(0, 'RainbowDelimiterRed'   , {default = true, fg = '#cc241d', ctermfg= 'Red'    })
-- set_hl(0, 'RainbowDelimiterOrange', {default = true, fg = '#d65d0e', ctermfg= 'White'  })
-- set_hl(0, 'RainbowDelimiterYellow', {default = true, fg = '#d79921', ctermfg= 'Yellow' })
-- set_hl(0, 'RainbowDelimiterGreen' , {default = true, fg = '#689d6a', ctermfg= 'Green'  })
-- set_hl(0, 'RainbowDelimiterCyan'  , {default = true, fg = '#a89984', ctermfg= 'Cyan'   })
-- set_hl(0, 'RainbowDelimiterBlue'  , {default = true, fg = '#458588', ctermfg= 'Blue'   })
-- set_hl(0, 'RainbowDelimiterViolet', {default = true, fg = '#b16286', ctermfg= 'Magenta'})
