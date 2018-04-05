" .vimrc
" Jared Bold
" 1.22.2015
"
execute pathogen#infect()
filetype indent plugin on
syntax on
set term=xterm-256color
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set lazyredraw
set ttyfast
set synmaxcol=1000
"let loaded_matchparen = 1
set nocursorcolumn
set nocursorline
"set nowrap

set hidden
set wildmenu
set wrap

set t_Co=256

set showcmd
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

" Line numbering
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
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

let mapleader= ","

" Color column over 80 characters
"autocmd BufWinEnter *.C,*.h let w:m1=matchadd('ErrorMsg', '\%>80v.\+',-1)

" Doxygen syntax
let g:load_doxygen_syntax=1

" Commands
" Filter
command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a
command! RemoveEolWhitepace :%s/\s\+$//

" Macro
map <leader>ws :%s/\s\+$//<CR>:noh<CR>
map <leader>cs :%s/,\(\S\)/, \1/g<CR>:noh<CR>
map <leader>{s :%s/\(\S\){/\1 {/g<CR>:noh<CR>

set cursorline
" Syntax highlight template files
autocmd BufRead,BufNewFile *.T set filetype=cpp
" Syntax for .def files to XML
autocmd BufRead,BufNewFile *.def set filetype=xml
autocmd BufRead,BufNewFile *.ih set filetype=xml
" Enable spell checking on gitcommit 
autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" Airline Settings
let g:airline_theme='murmur'

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%f

let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
"let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wundef -Wshadow -Wunreachable-code -DUSE_DTF_SEQIDS -DSIM_HAS_ISU -D_REDUCED_TFAC_VERSION_  -DP9XLATEONLY -DRTPG_2'
let g:syntastic_cpp_config_file = ".rtx_syntastic_includes"
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_include_dirs = ['/afs/awd.austin.ibm.com/proj/p3/cte/tools/fusion/vol1/releases/R80_0-noarch/src']

let g:syntastic_cpp_cppcheck_exec = '/afs/awd/projects/eclipz/c14/usr/pbunch/p9nd2/usr/bin/cppcheck'
let g:syntastic_cpp_cppcheck_args='--language=c++ -j `nproc` --enable=warning,style,performance,information,missingInclude --std=c++11'

let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_cpplint_args='--extension=C,h,T,c,H --filter=-build/include,-build/header_guard,-runtime/references --linelength=160'

let g:syntastic_aggregate_errors = 1
let g:syntastic_sort_aggregated_errors = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0

let g:syntastic_xml_xmllint_quiet_messages = {"regex":"failed to load external entity"}
let g:syntastic_cpp_gcc_quiet_messages = {"regex":"required from here"}

" Adjust the quickfix window height (used by syntastic)
"au FileType qf call AdjustWindowHeight(3, 10)
"function! AdjustWindowHeight(minheight, maxheight)
"  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
"endfunction

" Fugitive settings
set statusline+=%{fugitive#statusline()}
autocmd QuickFixCmdPost *grep* cwindow

" TagBar settings
nmap <leader>tb :TagbarToggle<CR>

" CtrlP settings
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_max_files=0
