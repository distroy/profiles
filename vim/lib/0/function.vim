"
" Copyright (C) distroy
"


if !exists('g:ld._ns_cache')
    let g:ld._ns_cache = {} " for buffer init
endif

function! g:ld.current_function()
    return ''
endfunction

function! g:ld.split(str, sep)
    let l:r = split(a:str, a:sep)
    if len(l:r) > 0
        return l:r
    endif
    return [a:str]
endfunction

function! g:ld._save_ns_cache(args)
    let l:args = a:args
    if len(l:args) > 0 && l:args[0] == 'ld'
        let g:ld._ns_cache[join(l:args, '.')] = l:args
    endif
endfunction

" let l:o = g:ld.namespace("ld", "goto")
" let l:o = g:ld.namespace(["ld", "goto"])
" let l:o = g:ld.namespace("ld.goto")
" let l:o = g:ld.namespace("b:ld.goto")
" let l:o = g:ld.namespace("b:", "ld", "goto")
" let l:o = g:ld.namespace(["b:", "ld", "goto"])
" let l:o = g:ld.namespace(b:, "ld", "goto")
" let l:o = g:ld.namespace([b:, "ld", "goto"])
function! g:ld.namespace(...)
    let l:args = a:000
    if len(l:args) == 0
        return
    endif

    if type(l:args[0]) == type([])
        let l:args = l:args[0]
    endif

    if type(l:args[0]) == type({})
        if len(l:args) == 2
            return g:ld._namespace(l:args[0], g:ld.split(l:args[1], '.'))
        endif
        return g:ld._namespace(l:args[0], l:args[1:])
    endif

    if len(l:args) == 1
        if type(l:args[0]) != type('')
            return
        endif
        let l:args = g:ld.split(l:args[0], '\.')
    endif

    let l:first = l:args[0]
    if l:first[1] == ':'
        if len(l:first) > 2
            let l:args[0] = l:first[2:]
            let l:first = l:first[:1]
        else
            let l:args = l:args[1:]
        endif
    else
        let l:first = ''
    endif

    if l:first == 'g:'
        call g:ld._save_ns_cache(l:args)
        return g:ld._namespace(g:, l:args)
    elseif l:first == 'b:'
        return g:ld._namespace(b:, l:args)
    elseif l:first == 'w:'
        return g:ld._namespace(w:, l:args)
    elseif l:first == 't:'
        return g:ld._namespace(t:, l:args)
    endif

    call g:ld._save_ns_cache(l:args)
    return g:ld._namespace(g:, l:args)
endfunction

function! g:ld._namespace(o, args)
    let l:o = a:o
    for l:k in a:args
        if !has_key(l:o, l:k)
            let l:o[l:k] = {}
        endif
        let l:o = l:o[l:k]
    endfor
    return l:o
endfunction

" call g:ld.setnx("key", "value")
" call g:ld.setnx("key0.key1. ... .keyN", "value")
" call g:ld.setnx("key0", "key1", ..., "keyN", "value")
" call g:ld.setnx("b:key0.key1. ... .keyN", "value")
" call g:ld.setnx(b:, "key0", "key1", ..., "keyN", "value")
" call g:ld.setnx("b:", "key0", "key1", ..., "keyN", "value")
function! g:ld.setnx(...)
    if len(a:000) < 2
        echoerr 'g:ld.setnx must have at least 2 parameters'
        return
    endif

    if len(a:000) > 2
        let l:path = a:000[:-3]
        let l:key = a:000[-2]
        let l:value = a:000[-1]
    else
        let l:value = a:000[1]
        let l:args = g:ld.split(a:000[0], '\.')
        if len(l:args) > 1
            let l:path = l:args[:-2]
            let l:key = l:args[-1]
        else
            let l:path = 'g:'
            let l:key = l:args[0]
        endif
    endif

    let l:obj = g:ld.namespace(l:path)
    if !has_key(l:obj, l:key)
        let l:obj[l:key] = l:value
    endif
endfunction

" call g:ld.set("key", "value")
" call g:ld.set("key0", "key1", ..., "keyN", "value")
" call g:ld.set(b:, "key0", "key1", ..., "keyN", "value")
function! g:ld.set(...)
    if len(a:000) < 2
        echoerr 'g:ld.set must have at least 2 parameters'
        return
    endif

    if len(a:000) > 2
        let l:path = a:000[:-3]
        let l:key = a:000[-2]
        let l:value = a:000[-1]
    else
        let l:value = a:000[1]
        let l:args = g:ld.split(a:000[0], '\.')
        if len(l:args) > 1
            let l:path = l:args[:-2]
            let l:key = l:args[-1]
        else
            let l:path = 'g:'
            let l:key = l:args[0]
        endif
    endif

    let l:obj = g:ld.namespace(l:path)
    let l:obj[l:key] = l:value
endfunction

function! g:ld.cache_directory(name)
    let l:directory = '~/.cache'
    let l:directory = fnamemodify(l:directory, ':p:h')
    let l:directory = l:directory . '/' . a:name
    return l:directory
endfunction
