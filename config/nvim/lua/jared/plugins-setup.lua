local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug("RRethy/base16-nvim")
Plug("nvim-lualine/lualine.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", {['tag'] = '0.1.8'})
Plug("dense-analysis/ale")
Plug("MarcWeber/vim-addon-local-vimrc")
Plug("neovim/nvim-lspconfig")
Plug("davidhalter/jedi-vim")
vim.call('plug#end')
