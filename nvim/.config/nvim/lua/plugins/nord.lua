return {
	"jwllzp/nord.nvim",
	dev = true,
	lazy = false,
	priority = 1000,
	config = function()
		require("nord").setup({
			transparent = true,
		})
	end,
}
