vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ higroup = "Visual" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "markdown" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function()
    if vim.wo.diff then
      vim.keymap.set("n", "<C-n>", ":qa<Enter>", { buffer = true })
    end
  end,
})
