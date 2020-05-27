" configuration for syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%f

let g:syntastic_mode_map = { 'mode': 'passive' }

let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler_options = '-O1 -std=c++11 -Wall -Wextra -Wundef -Wshadow -Wunreachable-code -Wunused-result'
let g:syntastic_cpp_check_header = 1

let g:syntastic_aggregate_errors = 1
let g:syntastic_sort_aggregated_errors = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_debug = 0

let g:syntastic_xml_xmllint_quiet_messages = {"regex":"failed to load external entity"}
let g:syntastic_cpp_gcc_quiet_messages = {"regex":"required from here"}
