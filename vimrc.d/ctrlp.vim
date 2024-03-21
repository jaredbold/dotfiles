" configuration for CtrlP plugin
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
   let g:ctrlp_user_command = 'rg --files'
endif
" if executable('ag')
"    let g:ctrlp_user_command = 'ag --noaffinity %s -l --nocolor -g ""'
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ -g ""'
" endif
let g:ctrlp_use_caching=1
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_cmd = 'CtrlPMixed'
