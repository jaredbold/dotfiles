" ALE config
let g:ale_fix_on_save = 1
let g:ale_linters_explicit=1
let g:ale_lint_on_insert_leave=1

let g:ale_linters = {'python': ['ruff', 'pylint']}
" let g:ale_linters = {'python': ['ruff', 'flake8', 'pylint']}
" let g:ale_linters = {'python': ['flake8', 'pylint']}
" let g:ale_fixers = {'python': ['black', 'isort']}
let g:ale_fixers = {'python': ['black','ruff']}
" let g:ale_fixers = {'python': ['ruff', 'black']}
" let g:ale_fixers = {'python': ['black']}
let g:ale_python_ruff_executable="/scratch/atl/ruff/releases/ruff-latest"
let g:ale_python_ruff_use_global=1

let g:ale_python_black_options='-t py311'
let g:ale_python_isort_options='--profile black'

let g:ale_python_flake8_options='--append-config ~/.config/flake8'

" Jedi config
" let g:jedi#auto_initialization = 1
" let g:jedi#auto_vim_configuration = 1
" let g:jedi#popup_select_first = 0
"
