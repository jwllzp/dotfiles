vim.pack.add({
	"https://github.com/laytan/cloak.nvim",
})

require("cloak").setup({
	enabled = true,
	cloak_character = "...",
	highlight_group = "Comment",
	cloak_length = 1,
	try_all_patterns = true,
	patterns = {
		{
			file_pattern = {
				".env*",
				".zshrc",
				".bashrc",
			},
			cloak_pattern = { "=.+", ":.+" },
			replace = nil,
		},
	},
})
