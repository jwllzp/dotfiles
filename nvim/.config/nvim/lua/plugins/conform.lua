return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				black = {
					command = "black",
					args = { "--line-length", "120", "--include", "'\\.py$'", "-" },
					stdin = true,
				},
				isort = {
					command = "isort",
					args = {
						"--line-length",
						"120",
						"--multi-line",
						"3",
						"--include-trailing-comma",
						"--use-parentheses",
						"--force-grid-wrap",
						"0",
						"-",
					},
					stdin = true,
				},
				rustfmt = {
					command = "rustfmt",
					args = { "--config-path", vim.fn.expand("~/.config/rustfmt/"), "--edition", "2024" },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
			},
		})
	end,
}
