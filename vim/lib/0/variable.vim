"
" Copyright (C) distroy
"


function s:init_variable(key, def)
    if !has_key(g:, a:key)
        let g:[a:key] = a:def
    endif

    return g:[a:key]
endfunction


call s:init_variable('ld#user', "distroy")
call s:init_variable('ld#email', "distroy@163.com")


if !exists('ld#copyright')
    let ld#copyright = []
    if exists('ld#company')
        call add(ld#copyright, 'Copyright (C) ' . ld#company)
    endif

    call add(ld#copyright, 'Copyright (C) ' . ld#user)
elseif type(ld#copyright) != v:t_list
    let ld#copyright = [ld#copyright]
endif
