local function brighten_hex(hex, amount)
	hex = hex:gsub("#", "")
	local r = tonumber("0x" .. hex:sub(1, 2))
	local g = tonumber("0x" .. hex:sub(3, 4))
	local b = tonumber("0x" .. hex:sub(5, 6))

	r = math.min(255, r + amount)
	g = math.min(255, g + amount)
	b = math.min(255, b + amount)

	return string.format("#%02x%02x%02x", r, g, b)
end

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local color = require("lackluster.color")
		local x = nil
		require("lackluster").setup({
			disable_plugin = {},
			tweak_background = {
				normal = "none",
				popup = "none",
				telescope = "none",
			},
			tweak_highlight = {
				CurLineNr = { fg = color.gray9, bold = true },
				Cursor = { reverse = true },
				Delimiter = { fg = color.lack },
				Normal = { fg = color.gray8 },
				OilDir = { fg = color.blue },
				["@boolean"] = { fg = color.lack },
				["@character"] = { link = "@string" },
				["@comment"] = { fg = color.gray5 },
				["@constant.builtin"] = { fg = color.lack },
				["@constructor"] = { link = "Delimiter" },
				["@function.method"] = { fg = color.gray8 },
				["@keyword"] = { fg = color.gray6, bold = true },
				["@keyword.return"] = { link = "@keyword" },
				["@lsp"] = { fg = color.gray8 },
				["@number"] = { fg = color.blue },
				["@number.float"] = { link = "@number" },
				["@operator"] = { fg = color.gray6, bold = true },
				["@property"] = { fg = color.lack },
				["@punctuation.bracket"] = { link = "Delimiter" },
				["@string"] = { fg = color.blue },
				["@type"] = { fg = color.gray9 },
				["@variable"] = { fg = color.gray7 },
			},
		})
		vim.cmd.colorscheme("lackluster")
	end,
}
