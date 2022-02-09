" ALE config
let g:ale_fix_on_save = 1
let g:ale_linters_explicit=1
let g:ale_lint_on_insert_leave=1

let g:ale_linters = {'python': ['flake8', 'pylint']}
let g:ale_fixers = {'python': ['black']}

let g:ale_python_black_options='-t py36'

" Jedi config
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#popup_select_first = 0
