"
" Copyright (C) distroy
"


function! g:ld.current_function()
    return ''
endfunction

function! g:ld.namespace(...)
    let l:obj = g:
    let l:i = 0
    for l:key in a:000
        if !has_key(l:obj, l:key)
            let l:obj[l:key] = {}
        endif
        let l:obj = l:obj[l:key]
    endfor
    return l:obj
endfunction
