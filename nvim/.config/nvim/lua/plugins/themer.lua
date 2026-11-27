-- local dev
-- vim.opt.rtp:prepend("/Users/jwllz/.herdr/worktrees/themer/mvp")
vim.pack.add({
	"https://github.com/jwllzp/themer",
})

require("themer").setup({
	highlights_variant = "semantic",
})

vim.cmd.colorscheme("themer")
