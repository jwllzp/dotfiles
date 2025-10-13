return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters = {
				rustfmt = {
					command = "rustfmt",
					args = { "--config-path", vim.fn.expand("~/.config/rustfmt/rustfmt.toml") },
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- python = { "black" },
				rust = { "rustfmt" },
			},
		})
	end,
}
