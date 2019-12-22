"
" Copyright (C) distroy
"


let g:ld.plug = get(g:ld, 'plug', {})
let g:ld.plug._disable = get(g:ld.plug, '_disable', {})

function! g:ld.plug.begin()
    let g:ld.plug._load = {}

    exec 'source' g:ld.vim_path . '/plugin/plug.vim'
    call plug#begin(g:ld.vim_path . '/plugin')
endfunction

function! g:ld.plug.end()
    call plug#end()  " required
endfunction

function! g:ld.plug.add(name, ...)
    let l:key = s:get_key(a:name)
    if has_key(g:ld.plug._disable, l:key)
        return
    endif

    let l:opts = s:get_opts(a:000)
    let g:ld.plug._load[l:key] = l:opts
    call plug#(a:name, l:opts)
endfunction

function! g:ld.plug.has(name)
    let l:key = s:get_key(a:name)
    return has_key(g:ld.plug._load, l:key)
endfunction

function! g:ld.plug.reset()
    let g:ld.plug._disable = {}
endfunction

function! g:ld.plug.disable(...)
    for l:name in s:parse_list(a:000)
        let l:key = s:get_key(l:name)
        let g:ld.plug._disable[l:key] = 1
    endfor
endfunction

function! g:ld.plug.enable(...)
    for l:name in s:parse_list(a:000)
        let l:key = s:get_key(l:name)
        if has_key(g:ld.plug._disable, l:key)
            unlet g:ld.plug._disable[l:key]
        endif
    endfor
endfunction

function! s:get_key(name)
    let l:list = split(a:name, '/')
    if len(l:list) == 0
        let l:key = a:name
    else
        let l:key = l:list[len(l:list) - 1]
    endif
    let l:key = tolower(l:key)
    return l:key
endfunction

function! s:get_opts(opts)
    if len(a:opts) == 0
        return {}
    endif

    let l:opts = a:opts[0]
    if has_key(l:opts, 'win') && has('win32')
        return l:opts['win']
    endif
    if has_key(l:opts, 'unix') && has('unix')
        return l:opts['unix']
    endif

    return l:opts
endfunction

function! s:parse_list(args)
    if len(a:args) == 0
        return []
    endif
    if len(a:args) == 1 && type(a:args[0]) == g:LD.T_LIST
        return a:args[0]
    endif
    return a:args
endfunction
