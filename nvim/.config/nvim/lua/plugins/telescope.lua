vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

local builtin = require("telescope.builtin")
local lga_actions = require("telescope-live-grep-args.actions")
local extensions = require("telescope").extensions

local function current_buffer_fuzzy_find()
	builtin.current_buffer_fuzzy_find({ fuzzy = true, case_mode = "ignore_case" })
end

local function find_files()
	builtin.find_files({ find_command = { "fd", "--type", "f", "--color", "never" } })
end

require("telescope").setup({
	defaults = {
		wrap_results = true,
		path_display = { filename_first = { reverse_directories = false } },
		-- path_display = { "absolute" },
	},
	pickers = {
		commands = {
			theme = "ivy",
			previewer = false,
		},
		find_files = {
			theme = "ivy",
			previewer = false,
		},
		git_files = {
			theme = "ivy",
			previewer = false,
		},
		lsp_document_symbols = {
			theme = "ivy",
			previewer = false,
		},
		lsp_references = {
			theme = "ivy",
			previewer = false,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		live_grep_args = {
			auto_quoting = true,
			previewer = true,
			mappings = {
				i = {
					["<C-k>"] = lga_actions.quote_prompt(),
					["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
					-- freeze the current list and start a fuzzy search in the frozen list
					["<C-f>"] = require("telescope.actions").to_fuzzy_refine,
				},
			},
		},
	},
})

require("telescope").load_extension("live_grep_args")
-- require("telescope").load_extension("fzf")

vim.keymap.set("n", "<leader>ff", find_files)
vim.keymap.set("n", "<leader>sf", function()
	builtin.git_files({
		show_untracked = true,
	})
end)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>gs", builtin.grep_string)
vim.keymap.set("n", "<leader>dg", builtin.diagnostics)
vim.keymap.set("n", "<leader>gc", builtin.commands)
vim.keymap.set("n", "<leader>bb", builtin.buffers)
vim.keymap.set("n", "<leader>ss", current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>fg", extensions.live_grep_args.live_grep_args)
