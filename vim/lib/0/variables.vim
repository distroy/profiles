"
" Copyright (C) distroy
"


function s:ld_init_global_variable(key, def)
    if !has_key(g:, a:key)
        let g:[a:key] = a:def
    endif

    return g:[a:key]
endfunction


call s:ld_init_global_variable('ld_user', "distroy")
call s:ld_init_global_variable('ld_email', "distroy@163.com")
