local M = {}

local function copy_github(is_visual)
  local path = vim.fn.expand("%:.")

  local remote = vim.fn.system("git remote get-url origin"):gsub("%s+", "")
  local repo = remote:match("[:/]([^/]+/[^/]+)%.git$")

  local branch = vim.fn
    .system("git symbolic-ref refs/remotes/origin/HEAD")
    :gsub("%s+", "")
    :match("origin/(.+)$")

  local suffix = ""
  if is_visual then
    local s = vim.fn.line("'<")
    local e = vim.fn.line("'>")
    if s > e then s, e = e, s end
    suffix = s == e and ("#L%d"):format(s) or ("#L%d-L%d"):format(s, e)
  end

  local url = ("https://github.com/%s/blob/%s/%s%s")
    :format(repo, branch, path, suffix)

  vim.fn.setreg("+", url)

  if is_visual then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
      "n",
      true
    )
  end
end

local function copy_file()
  vim.fn.setreg("+", vim.fn.expand("%:."))
end

function M.setup()
  local function dispatcher(is_visual)
    print("1: local\n2: github")
    local c = vim.fn.getchar()

    if c == string.byte("1") then
      copy_file()
    elseif c == string.byte("2") then
      copy_github(is_visual)
    end
  end

  vim.keymap.set("n", "<leader>yf", function()
    dispatcher(false)
  end, { desc = "Copy local path or GitHub URL" })

  vim.keymap.set("x", "<leader>yf", function()
    dispatcher(true)
  end, { desc = "GitHub URL (selection-aware)" })
end

return M
