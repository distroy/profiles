"
" Copyright (C) distroy
"


function! ld#set_tab(w)
    let l:w = a:w
    let &l:tabstop      = l:w
    let &l:shiftwidth   = l:w
    let &l:softtabstop  = l:w
endfunction


function! ld#set_tags(path)
    if &l:tags != ''
        let &l:tags .= ','
    endif

    let &l:tags .= a:path
endfunction


