local getRoot = function()
  local root_patterns = { ".git" }
  return vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
end

local mypyArgs = function()
  local args = {}
  local root_dir = getRoot()
  if root_dir ~= nil then
    if vim.fn.filereadable(root_dir .. "/atl/src/make/mypy_v2.ini") then
      args = { "--strict", "--config-file", root_dir .. "/atl/src/make/mypy_v2.ini" }
    end
  end
  return args
end

local pylintArgs = function()
  local args = {}
  local root_dir = getRoot()
  if root_dir ~= nil then
    if vim.fn.filereadable(root_dir .. "/fpga/pylintrc") then
      args = { "--rcfile", root_dir .. "/fpga/pylintrc" }
    end
  end
  return args
end

local mypyPath = function()
  local root_dir = getRoot()
  if root_dir == nil then
    return ""
  end
  local paths = root_dir
    .. "/.partial_stubs:"
    .. root_dir
    .. "/atl/src/make/typeshed_extensions:"
    .. root_dir
    .. "/pyimports:"
    .. root_dir
    .. "/atl/src/make"
  vim.fn.setenv("MYPYPATH", paths)
  return ""
end

local slangArgs = function()
  local root_dir = getRoot()
  local args = { "--lint-only" }
  if root_dir ~= nil then
    table.insert(args, "-I=" .. root_dir .. "/fpga/include," .. root_dir .. "/fpga," .. root_dir .. "/fpga/library")
  end
  return args
end

return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        python = { "mypy", "pylint" },
        verilog = { "slang" },
        systemverilog = { "slang" },
      },
      linters = {
        mypy = {
          cmd = "/home/jared/bin/checkpy_mypy.sh",
          prepend_args = mypyArgs(),
          setup = mypyPath(),
        },
        pylint = {
          prepend_args = pylintArgs(),
        },
        slang = {
          prepend_args = slangArgs(),
        },
      },
    },
  },
}
