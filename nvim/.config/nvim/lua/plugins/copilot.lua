return {
	"github/copilot.vim",
	lazy = true,
	ft = { "python", "sh", "Dockerfile", "lua" },
	config = function()
		vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})

		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "solarized",
			-- group = ...,
			callback = function()
				vim.api.nvim_set_hl(0, "CopilotSuggestion", {
					fg = "#555555",
					ctermfg = 8,
					force = true,
				})
			end,
		})

		vim.g.copilot_no_tab_map = true
	end,
}
