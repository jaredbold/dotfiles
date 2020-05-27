" .vimrc
" Jared Bold
" 1.22.2015
"
" Plugin Installation
execute pathogen#infect()

" Default settings
set term=xterm-256color
set t_Co=256

" Performance Settings
set lazyredraw
set ttyfast

" User Experience settings
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set noeb vb t_vb=
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200

set synmaxcol=1000
set nocursorcolumn
set hidden
set wildmenu
set wrap
set showcmd
set cursorline

" Line numbering (relative in normal mode, absolute in insert mode)
set number
if exists('+relativenumber')
  set relativenumber
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END
endif

" Tab settings
filetype indent plugin on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

let mapleader= ","

" Syntax
syntax on
let g:load_doxygen_syntax=1

" Commands
" Filter
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" Macros
" Remove whitespace
map <leader>ws :%s/\s\+$//<CR>:noh<CR>
" Add space after comma
map <leader>cs :%s/,\(\S\)/, \1/g<CR>:noh<CR>
" Add space before open parenthese
map <leader>{s :%s/\(\S\){/\1 {/g<CR>:noh<CR>
" Add std:: prefix for some STL classes
map <leader>std :%s/\(\(#include.*\)\\|\(\<std::\)\)\@<!\<\(ostream\\|stringstream\\|deque\\|unique_ptr\\|shared_ptr\\|string\\|vector\\|unordered_set\\|unordered_map\\|u\?int\d\+_t\)\>/std::\4/g<CR>:noh<CR>

" Syntax highlight template files
autocmd BufRead,BufNewFile *.T set filetype=cpp
" Syntax for .def files to XML
autocmd BufRead,BufNewFile *.def set filetype=xml
autocmd BufRead,BufNewFile *.ih set filetype=xml
" Enable spell checking on gitcommit 
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" Load other vim scripts
let vimrc_dir = "~/.vimrc.d"
let g:loaded_files = ['none']
for f in split(glob('~/.vimrc.d/*.vim'), '\n')
  call add(g:loaded_files, f)
  exe 'source' f
endfor


