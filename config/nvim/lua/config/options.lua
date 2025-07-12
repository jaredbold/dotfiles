-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- overides for lazyvim global defaults
vim.g.mapleader = ","
vim.g.snacks_animate = false
vim.g.lazyvim_python_lsp = "jedi_language_server"

-- overides for lazyvim opt defaults
local opt = vim.opt
opt.splitbelow = false
opt.mouse = ""
opt.incsearch = false
opt.formatoptions = "jcroqln"
opt.textwidth = 80

-- python
vim.g.python3_host_prog = "/home/jared/venvs/neovim/bin/python"

-- commands
vim.api.nvim_create_user_command(
  "Filter",
  "let @a=\"\" | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a",
  { nargs = "?" }
)

-- enable spell check on commit messages
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "COMMIT_EDITMSG",
  callback = function(_)
    vim.opt_local.spell = true
  end,
})
