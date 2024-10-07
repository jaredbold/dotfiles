vim.env.PATH = vim.env.PATH .. ':/home/jared/venvs/neovim/bin'
require'lspconfig'.jedi_language_server.setup{}
