return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				enable = true,
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
			},
		})

		local map_select = function(keys, text_object)
			vim.keymap.set({ "x", "o" }, keys, function()
				require("nvim-treesitter-textobjects.select").select_textobject(text_object, "textobjects")
			end)
		end

		local map_move = function(keys, text_object, goto_mode)
			local move = require("nvim-treesitter-textobjects.move")
			local move_fn = {
				next_start = move.goto_next_start,
				next_end = move.goto_next_end,
				previous_start = move.goto_previous_start,
				previous_end = move.goto_previous_end,
			}

			vim.keymap.set({ "n", "x", "o" }, keys, function()
				move_fn[goto_mode](text_object, "textobjects")
			end)
		end

		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		map_select("af", "@function.outer")
		map_select("if", "@function.inner")
		map_select("ac", "@class.outer")
		map_select("ic", "@class.inner")
		map_select("as", "@scope")
		map_select("rs", "@assignment.rhs")

		map_move("]m", "@function.outer", "next_start")
		map_move("]]", "@class.outer", "next_start")
		map_move("]M", "@function.outer", "next_end")
		map_move("][", "@class.outer", "next_end")
		map_move("[m", "@function.outer", "previous_start")
		map_move("[[", "@class.outer", "previous_start")
		map_move("[M", "@function.outer", "previous_end")
		map_move("[]", "@class.outer", "previous_end")

		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
	end,
}
