"
" Copyright (C) distroy
"


let g:go_template_autocreate = 0

let g:go_def_mapping_enabled = 0
autocmd FileType go nnoremap <buffer> <silent> <C-w><C-]> :<C-u>call go#def#Jump("tab", 0)<CR>
autocmd FileType go nnoremap <buffer> <silent> <C-w>] :<C-u>call go#def#Jump("tab", 0)<CR>
