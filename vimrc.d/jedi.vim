" jedi-vim settings
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1

autocmd FileType python setlocal completeopt-=preview
