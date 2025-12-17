return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	config = function()
		require("nvim-treesitter").install({ "lua", "vim", "vimdoc", "query", "python", "scala", "json", "rust" })
	end,
}
