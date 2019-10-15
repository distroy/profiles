"
" Copyright (C) distroy
"


function! g:ld.current_function()
    return ''
endfunction

if !exists('g:ld._ns_cache')
    let g:ld._ns_cache = {}
endif

function! g:ld.namespace(...)
    if len(a:000) > 0 && a:000[0] == 'ld'
        let l:key = join(a:000, '.')
        let g:ld._ns_cache[l:key] = a:000
    endif
    return g:ld._namespace(g:, a:000)
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

function! g:ld.cache_directory(name)
    let l:directory = '~/.cache/' . a:name
    let l:directory = fnamemodify(l:directory, ':p:h')
    return l:directory
endfunction
