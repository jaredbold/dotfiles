SCHEME_FILE = vim.fn.expand("~/.base16_current_scheme")

local updateColorScheme = function()
  if vim.fn.filereadable(SCHEME_FILE) then
    local contents = vim.fn.readfile(SCHEME_FILE, "", 1)[1]
    local scheme = "base16-" .. contents
    vim.cmd("colorscheme " .. scheme)
  end
end

local installColorSchemeWatcher = function()
  -- Use .base16_current_scheme gets updated whenever the background changes
  if vim.fn.filereadable(SCHEME_FILE) then
    local w = vim.uv.new_fs_event()
    local on_change = function(_, _, _)
      updateColorScheme()
    end

    local function watch_file(fname)
      local fullpath = vim.api.nvim_call_function("fnamemodify", { fname, ":p" })
      w:start(
        fullpath,
        {},
        vim.schedule_wrap(function(...)
          on_change(...)
        end)
      )
    end

    watch_file(SCHEME_FILE)
  end
end

return {
  {
    "RRethy/base16-nvim",
    config = function()
      require("base16-colorscheme").with_config()
      updateColorScheme()
      installColorSchemeWatcher()
    end,
  },
}
