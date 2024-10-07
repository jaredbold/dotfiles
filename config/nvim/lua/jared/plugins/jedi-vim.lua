vim.g["jedi#auto_initialization"] = 1
vim.g["jedi#auto_vim_configuration"] = 1
vim.g["jedi#use_tabs_not_buffers"] = 1
vim.g["jedi#popup_select_first"] = 0
vim.g["jedi#show_call_signatures"] = "1"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(ev)
    vim.opt_local.completeopt = vim.opt_local.completeopt - "preview"
  end
})
