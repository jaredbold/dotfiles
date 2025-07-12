local isDevDir = function(root_dir)
  -- Checks if the current root_dir is a dev directory
  local hasDir = function(dir)
    return vim.fn.filereadable(root_dir .. "/" .. dir)
  end
  local devDirs = { "algo", "fpga", "atl" }
  for dir in pairs(devDirs) do
    if not hasDir(dir) then
      return false
    end
  end
  return true
end

local resolveImportSymlinks = function(importDir)
  local paths = {}
  for name, type in vim.fs.dir(importDir) do
    local fullPath = importDir .. "/" .. name
    if type == "link" then
      local resolvedPath = vim.fn.resolve(fullPath)
      local resolvedDir = vim.fs.dirname(resolvedPath)
      local resolvedBasename = vim.fs.basename(resolvedPath)
      local linkBasename = vim.fs.basename(fullPath)
      if linkBasename == resolvedBasename then
        table.insert(paths, resolvedDir)
      end
    end
  end
  return paths
end

return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        -- basedpyright = {
        --   root_dir = require("lspconfig.util").root_pattern(".git", "pyrightconfig.json"),
        -- },
        jedi_language_server = {
          root_dir = require("lspconfig.util").root_pattern(".git"),
        },
      },
      setup = {
        jedi_language_server = function(_, opts)
          local root_dir = vim.fn.fnamemodify(opts.root_dir(), ":p")
          local extraPaths = {}
          local pyimportDir = root_dir .. "/pyimports"
          if root_dir ~= nil then
            if isDevDir(root_dir) then
              -- load these extra imports if in dev dir to make completion work
              for _, path in ipairs(resolveImportSymlinks(pyimportDir)) do
                -- we need to resolve the symlinks so that go to definition
                -- takes us to the file instead of the symlink
                table.insert(extraPaths, path)
              end
              table.insert(extraPaths, root_dir .. "/fpga/static_pythonenv")
              table.insert(extraPaths, root_dir .. "/atl/src/make/typeshed_extensions")
              table.insert(extraPaths, root_dir .. "/atl/src/make")
            end
          end
          require("lspconfig").jedi_language_server.setup({
            init_options = {
              workspace = {
                extraPaths = extraPaths,
                symbols = {
                  maxSymbols = 0,
                },
              },
            },
          })
          return true
        end,
      },
    },
  },
}
