"
" Copyright (C) distroy
"


function s:init_variable(key, def)
    if !has_key(g:ld, a:key)
        let g:ld[a:key] = a:def
    endif

    return g:ld[a:key]
endfunction


call s:init_variable('user', "distroy")
call s:init_variable('email', "distroy@163.com")
call s:init_variable('copyright', [])
