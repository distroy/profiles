"
" Copyright (C) distroy
"


let s:current_directory = fnamemodify(resolve(expand('<sfile>:p')), ':h')


let g:ld.ccls = {}
let g:ld.ccls.init_options = {
    \   'cache': {
    \       'directory': g:ld.cache_directory("ccls"),
    \   }
    \ }
