local function get_key()
	local branch = vim.fn.system("git branch --show-current")
	local cwd = vim.loop.cwd()
	if branch then
		cwd = cwd .. "::" .. branch
	end
	return cwd
end

local name = get_key()

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local nav_opts = { ui_nav_wrap = true }

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = get_key,
			},
		})

		local window_opts = {
			title = " Harpoon ",
			title_pos = "center",
			border = "rounded",
		}

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list(name):add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(name), window_opts)
		end)
		vim.keymap.set("n", "<space>a", function()
			harpoon:list(name):select(1)
		end)
		vim.keymap.set("n", "<space>s", function()
			harpoon:list(name):select(2)
		end)
		vim.keymap.set("n", "<space>d", function()
			harpoon:list(name):select(3)
		end)
		vim.keymap.set("n", "<space>f", function()
			harpoon:list(name):select(4)
		end)
		vim.keymap.set("n", "<space>g", function()
			harpoon:list(name):select(5)
		end)
		vim.keymap.set("n", "<leader>p", function()
			harpoon:list(name):prev(nav_opts)
		end)
		vim.keymap.set("n", "<leader>n", function()
			harpoon:list(name):next(nav_opts)
		end)

		vim.api.nvim_create_autocmd("BufEnter", {
			group = "Harpoon",
			callback = function()
				local current_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
				local current_list = harpoon:list()
				for idx, item in ipairs(current_list["items"]) do
					local path = item["value"]
					if current_path == path then
						current_list["_index"] = idx
					end
				end
			end,
		})
	end,
}
