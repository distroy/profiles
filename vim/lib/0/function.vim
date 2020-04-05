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
    if l:args[0] == 'ld'
        let g:ld._ns_cache[join(l:args, '.')] = l:args
    endif
endfunction

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
        let l:args = g:ld.split(l:args[0], '.')
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

function! g:ld.setnx(...)
    if len(a:000) < 3
        return
    endif
    let l:path = a:000[:-3]
    let l:key = a:000[-2]
    let l:value = a:000[-1]
    let l:obj = g:ld.namespace(l:path)
    if !has_key(l:obj, l:key)
        let l:obj[l:key] = l:value
    endif
endfunction

function! g:ld.set(...)
    if len(a:000) < 3
        return
    endif
    let l:path = a:000[:-3]
    let l:key = a:000[-2]
    let l:value = a:000[-1]
    let l:obj = g:ld.namespace(l:path)
    let l:obj[l:key] = l:value
endfunction

function! g:ld.cache_directory(name)
    let l:directory = '~/.cache'
    let l:directory = fnamemodify(l:directory, ':p:h')
    let l:directory = l:directory . '/' . a:name
    return l:directory
endfunction
