-- matrix: green phosphor on black. Wake up, Neo...
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "matrix"

local c = {
	bg = "#020803",
	bg_alt = "#07140a", -- cursorline, floats
	bg_sel = "#0f3d1c", -- visual
	border = "#134d22",
	dim = "#1e5c2e", -- line numbers, whitespace
	comment = "#2e8a48",
	jade = "#19b34a", -- punctuation, operators
	fg = "#3fdc63", -- default text
	bright = "#00ff41", -- keywords
	pale = "#7dffa0", -- functions
	glow = "#c8ffd4", -- strings: the white-hot leading glyph
	lime = "#c6ff3e", -- constants, numbers
	mint = "#00e5a0", -- types
	cyan = "#5effe0",
	red = "#ff3b5c",
	amber = "#e0ff7a",
}

local hl = {
	-- editor
	Normal = { fg = c.fg, bg = c.bg },
	NormalNC = { link = "Normal" },
	NormalFloat = { link = "Normal" },
	FloatBorder = { fg = c.border },
	FloatTitle = { fg = c.bright, bg = c.bg_alt, bold = true },
	Cursor = { fg = c.bg, bg = c.bright },
	CursorLine = { bg = c.bg_alt },
	CursorColumn = { bg = c.bg_alt },
	ColorColumn = { bg = c.bg_alt },
	CursorLineNr = { fg = c.bright, bold = true },
	LineNr = { fg = c.dim },
	SignColumn = { fg = c.dim },
	FoldColumn = { fg = c.dim },
	Folded = { fg = c.comment, bg = c.bg_alt },
	VertSplit = { fg = c.border },
	WinSeparator = { fg = c.border },
	Visual = { bg = c.bg_sel },
	VisualNOS = { bg = c.bg_sel },
	Search = { fg = c.bg, bg = c.jade },
	IncSearch = { fg = c.bg, bg = c.bright, bold = true },
	CurSearch = { link = "IncSearch" },
	Substitute = { fg = c.bg, bg = c.lime },
	MatchParen = { fg = c.glow, bg = c.border, bold = true },
	NonText = { fg = c.dim },
	Whitespace = { fg = c.dim },
	SpecialKey = { fg = c.dim },
	EndOfBuffer = { fg = c.bg },
	Directory = { fg = c.bright, bold = true },
	Title = { fg = c.bright, bold = true },
	Conceal = { fg = c.comment },
	Pmenu = { fg = c.fg, bg = c.bg_alt },
	PmenuSel = { fg = c.glow, bg = c.bg_sel, bold = true },
	PmenuSbar = { bg = c.bg_alt },
	PmenuThumb = { bg = c.border },
	WildMenu = { link = "PmenuSel" },
	StatusLine = { fg = c.fg, bg = c.bg_alt },
	StatusLineNC = { fg = c.dim, bg = c.bg_alt },
	TabLine = { fg = c.comment, bg = c.bg_alt },
	TabLineSel = { fg = c.bright, bg = c.bg, bold = true },
	TabLineFill = { bg = c.bg_alt },
	WinBar = { fg = c.fg },
	WinBarNC = { fg = c.dim },
	ModeMsg = { fg = c.bright, bold = true },
	MoreMsg = { fg = c.bright },
	Question = { fg = c.pale },
	ErrorMsg = { fg = c.red, bold = true },
	WarningMsg = { fg = c.amber },
	QuickFixLine = { bg = c.bg_sel },
	SpellBad = { sp = c.red, undercurl = true },
	SpellCap = { sp = c.amber, undercurl = true },
	SpellLocal = { sp = c.cyan, undercurl = true },
	SpellRare = { sp = c.mint, undercurl = true },

	-- syntax
	Comment = { fg = c.comment },
	Constant = { fg = c.lime },
	String = { fg = c.glow },
	Character = { fg = c.glow },
	Number = { fg = c.lime },
	Boolean = { fg = c.lime, bold = true },
	Float = { fg = c.lime },
	Identifier = { fg = c.fg },
	Function = { fg = c.pale },
	Statement = { fg = c.bright, bold = true },
	Keyword = { fg = c.bright, bold = true },
	Conditional = { link = "Keyword" },
	Repeat = { link = "Keyword" },
	Label = { link = "Keyword" },
	Exception = { link = "Keyword" },
	Operator = { fg = c.jade },
	PreProc = { fg = c.mint },
	Include = { fg = c.bright, bold = true },
	Type = { fg = c.mint },
	StorageClass = { fg = c.bright, bold = true },
	Structure = { fg = c.mint },
	Special = { fg = c.cyan },
	SpecialChar = { fg = c.cyan },
	Delimiter = { fg = c.jade },
	Tag = { fg = c.bright },
	Underlined = { fg = c.pale, underline = true },
	Error = { fg = c.red },
	Todo = { fg = c.bg, bg = c.bright, bold = true },

	-- treesitter
	["@variable"] = { fg = c.fg },
	["@variable.builtin"] = { fg = c.mint },
	["@variable.parameter"] = { fg = c.fg },
	["@variable.member"] = { fg = c.fg },
	["@property"] = { fg = c.fg },
	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { fg = c.lime, bold = true },
	["@module"] = { fg = c.mint },
	["@string"] = { link = "String" },
	["@string.escape"] = { fg = c.cyan },
	["@string.regexp"] = { fg = c.cyan },
	["@string.documentation"] = { fg = c.comment },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { fg = c.pale },
	["@function.call"] = { fg = c.pale },
	["@function.method"] = { fg = c.pale },
	["@constructor"] = { fg = c.mint },
	["@keyword"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Keyword" },
	["@keyword.return"] = { link = "Keyword" },
	["@keyword.operator"] = { link = "Keyword" },
	["@type"] = { link = "Type" },
	["@type.builtin"] = { fg = c.mint },
	["@attribute"] = { fg = c.cyan },
	["@punctuation"] = { fg = c.jade },
	["@punctuation.bracket"] = { fg = c.jade },
	["@punctuation.delimiter"] = { fg = c.jade },
	["@tag"] = { fg = c.bright },
	["@tag.attribute"] = { fg = c.pale },
	["@tag.delimiter"] = { fg = c.jade },
	["@markup.heading"] = { fg = c.bright, bold = true },
	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.link"] = { fg = c.pale, underline = true },
	["@markup.raw"] = { fg = c.glow },
	["@markup.list"] = { fg = c.jade },
	["@comment.todo"] = { link = "Todo" },
	["@comment.error"] = { fg = c.bg, bg = c.red, bold = true },
	["@comment.warning"] = { fg = c.bg, bg = c.amber, bold = true },
	["@comment.note"] = { fg = c.bg, bg = c.cyan, bold = true },
	["@lsp.type.comment"] = {},

	-- diagnostics
	DiagnosticError = { fg = c.red },
	DiagnosticWarn = { fg = c.amber },
	DiagnosticInfo = { fg = c.cyan },
	DiagnosticHint = { fg = c.comment },
	DiagnosticOk = { fg = c.bright },
	DiagnosticUnderlineError = { sp = c.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = c.amber, undercurl = true },
	DiagnosticUnderlineInfo = { sp = c.cyan, undercurl = true },
	DiagnosticUnderlineHint = { sp = c.comment, undercurl = true },
	DiagnosticUnnecessary = { fg = c.dim },
	LspReferenceText = { bg = c.bg_sel },
	LspReferenceRead = { bg = c.bg_sel },
	LspReferenceWrite = { bg = c.bg_sel, bold = true },
	LspInlayHint = { fg = c.dim },

	-- diff / git
	DiffAdd = { bg = "#0a2a12" },
	DiffChange = { bg = "#0c2416" },
	DiffDelete = { fg = c.red, bg = "#2a0a10" },
	DiffText = { bg = c.bg_sel, bold = true },
	Added = { fg = c.bright },
	Changed = { fg = c.amber },
	Removed = { fg = c.red },
	GitSignsAdd = { fg = c.bright },
	GitSignsChange = { fg = c.amber },
	GitSignsDelete = { fg = c.red },

	-- telescope
	TelescopeNormal = { link = "NormalFloat" },
	TelescopeBorder = { link = "FloatBorder" },
	TelescopeTitle = { link = "FloatTitle" },
	TelescopeSelection = { fg = c.glow, bg = c.bg_sel, bold = true },
	TelescopeSelectionCaret = { fg = c.bright, bg = c.bg_sel },
	TelescopeMatching = { fg = c.bright, bold = true },
	TelescopePromptPrefix = { fg = c.bright },

	-- cmp
	CmpItemAbbrMatch = { fg = c.bright, bold = true },
	CmpItemAbbrMatchFuzzy = { fg = c.bright },
	CmpItemAbbrDeprecated = { fg = c.dim, strikethrough = true },
	CmpItemKind = { fg = c.mint },
	CmpItemMenu = { fg = c.comment },

	-- oil
	OilDir = { link = "Directory" },

	-- rainbow-delimiters
	RainbowDelimiter1 = { fg = c.bright },
	RainbowDelimiter2 = { fg = c.mint },
	RainbowDelimiter3 = { fg = c.lime },

	-- treesitter-context
	TreesitterContext = { bg = c.bg_alt },
}

for group, spec in pairs(hl) do
	vim.api.nvim_set_hl(0, group, spec)
end

local term = {
	c.bg,
	c.red,
	c.bright,
	c.lime,
	"#00c47a",
	"#8cffb4",
	c.cyan,
	"#9fe0ad",
	c.dim,
	"#ff6b7f",
	"#5cff7f",
	c.amber,
	"#3dffa8",
	c.glow,
	"#9effe9",
	"#e6ffe9",
}
for i, color in ipairs(term) do
	vim.g["terminal_color_" .. (i - 1)] = color
end
