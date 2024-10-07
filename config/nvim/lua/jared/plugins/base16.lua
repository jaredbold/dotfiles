if vim.fn.filereadable(vim.fn.expand("~/.vimrc_background")) then
  vim.g.base16colorspace=256
  vim.cmd("source ~/.vimrc_background")

  local w = vim.uv.new_fs_event()
  local function on_change(err, fname, status)
    vim.cmd("source ~/.vimrc_background")
  end

  function watch_file(fname)
    local fullpath = vim.api.nvim_call_function(
      'fnamemodify', {fname, ':p'})
    w:start(fullpath, {}, vim.schedule_wrap(function(...)
      on_change(...) end))
  end

  watch_file(vim.fn.expand("~/.vimrc_background"))
end
