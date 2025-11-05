return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				black = {
					command = "black",
					args = { "--line-length", "120", "-" },
					stdin = true,
				},
				rustfmt = {
					command = "rustfmt",
					args = { "--config-path", vim.fn.expand("~/.config/rustfmt/"), "--edition", "2024" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
			},
		})
	end,
}
