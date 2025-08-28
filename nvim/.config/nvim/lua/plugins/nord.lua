return {
	"jwllzp/nord.nvim",
	dir = "~/projects/nvim/nord.nvim/",
	dev = true,
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup()
	end,
}
