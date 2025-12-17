return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
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
	end,
}
