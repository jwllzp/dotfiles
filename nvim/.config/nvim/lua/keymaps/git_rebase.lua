local M = {}

local function set_qfix_list_with_conficts()
	local modified_raw = vim.cmd("!git diff --name-only")
	print(modified_raw)
end

function M.setup()
	vim.keymap.set("n", "<leader>yr", set_qfix_list_with_conficts, { desc = "Populate quickfix with rebase hunks" })
end

return M
