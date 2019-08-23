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
    call plug#(a:name, l:opts)

    let l:list = split(a:name, '/')
    let l:name = l:list[len(l:list) - 1]
    let l:name = tolower(l:name)
    let g:ld.plug.cache[l:name] = l:opts
endfunction

function! g:ld.plug.has(name)
    let l:name = tolower(a:name)
    return has_key(g:ld.plug.cache, l:name)
endfunction
