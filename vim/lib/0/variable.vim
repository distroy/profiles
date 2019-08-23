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


if !exists('g:ld.copyright')
    let g:ld.copyright = []
    if exists('g:ld.company')
        call add(g:ld.copyright, 'Copyright (C) ' . g:ld.company)
    endif

    call add(g:ld.copyright, 'Copyright (C) ' . g:ld.user)
elseif type(g:ld.copyright) != v:t_list
    let g:ld.copyright = [g:ld.copyright]
endif
