"
" Copyright (C) distroy
"


if exists('g:ld_loaded_vimrc')
    finish
endif
let g:ld_loaded_vimrc = 1


if !exists('g:ld_user')
    let g:ld_user = 'distroy'
endif
if !exists('g:ld_email')
    let g:ld_email = 'distroy@163.com'
endif


if !exists('g:ld_tagshow')
    let g:ld_tagshow = 'tagbar'
endif


let s:path = fnamemodify(expand('<sfile>:p'), ':p:h')
let s:list = split(globpath(s:path, 'lib/vim/*.vim'), '\n')
for s:i in s:list
    exec 'source' s:i
endfor


