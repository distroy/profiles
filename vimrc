"
" Copyright (C) distroy
"


if exists('g:ld_load_vimrc')
    finish
endif
let g:ld_load_vimrc = 1


let s:path = fnamemodify(expand('<sfile>:p'), ':p:h')
let s:list = split(globpath(s:path, 'lib/*.vim'), '\n')
for s:i in s:list
    exec 'source' s:i
endfor


