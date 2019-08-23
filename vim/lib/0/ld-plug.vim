"
" Copyright (C) distroy
"


let g:ld.plug = get(g:ld, 'plug', {})

function! g:ld.plug.begin()
    exec 'source' g:ld.vim_path . '/plugin/plug.vim'
    call plug#begin(g:ld.vim_path . '/plugin')
    let g:ld.plug.cache = {}
endfunction

function! g:ld.plug.end()
    call plug#end()  " required
endfunction

function! g:ld.plug.add(name, ...)
    if a:0 == 0
        let l:opts = {}
    else
        let l:opts = a:1
    endif
    let g:ld.plug.cache[a:name] = l:opts
    call plug#(a:name, l:opts)
endfunction

function! g:ld.plug.has(name)
    return has_key(g:ld.plug.cache, a:name)
endfunction
