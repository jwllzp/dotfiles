return {
	"jameswalls/ai-chat.nvim",
	dev = true,
	lazy = false,
	config = function()
		require("aichat").setup()
	end,
}
