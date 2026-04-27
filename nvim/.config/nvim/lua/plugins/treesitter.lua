vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

-- base treesitter
require("nvim-treesitter").setup({
	ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "scala", "json", "rust" },
	modules = {},
	ignore_install = {},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader><space>",
			node_incremental = "<space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})

-- text objects
require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v", -- charwise
			["@function.outer"] = "V", -- linewise
			["@class.outer"] = "<c-v>", -- blockwise
		},
		include_surrounding_whitespace = false,
	},
	move = {
		set_jumps = false, -- whether to set jumps in the jumplist
	},
})

vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "as", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@scope", "textobjects")
end)
vim.keymap.set({ "x", "o" }, "rs", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
end)

vim.keymap.set({ "n", "x", "o" }, "]m", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "]M", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "][", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[m", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[M", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[]", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end)

-- context
require("treesitter-context").setup({
	enable = true,
	max_lines = 5,
	min_window_height = 0,
	line_numbers = true,
	multiline_threshold = 1,
	trim_scope = "inner",
	mode = "topline",
	separator = "",
	zindex = 20,
	on_attach = nil,
})

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "Normal" })
vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true })
