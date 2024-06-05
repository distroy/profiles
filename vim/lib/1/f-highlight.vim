"
" Copyright (C) distroy
"


function! g:ld.highlight(name, fg, bg, style)
    let l:l = ['highlight', a:name]

    if type(a:fg) == g:LD.T_NUMBER
        let l:l = add(l:l, 'ctermfg=' . a:fg)

    elseif type(a:fg) == g:LD.T_STRING
        if a:fg[0] == '#'
            let l:l = add(l:l, 'guifg=' . a:fg)
        elseif a:fg != ''
            let l:l = add(l:l, 'ctermfg=' . a:fg)
        endif

    elseif type(a:fg) == g:LD.T_LIST
        if a:fg[0] != ''
            let l:l = add(l:l, 'ctermfg=' . a:fg[0])
        endif
        if a:fg[1] != ''
            let l:l = add(l:l, 'guifg=' . a:fg[1])
        endif
    endif

    if type(a:bg) == g:LD.T_NUMBER
        let l:l = add(l:l, 'ctermbg=' . a:bg)

    elseif type(a:bg) == g:LD.T_STRING
        if a:bg[0] == '#'
            let l:l = add(l:l, 'guibg=' . a:bg)
        elseif a:bg != ''
            let l:l = add(l:l, 'ctermbg=' . a:bg)
        endif

    elseif type(a:bg) == g:LD.T_LIST
        if a:bg[0] != ''
            let l:l = add(l:l, 'ctermbg=' . a:bg[0])
        endif
        if a:bg[1] != ''
            let l:l = add(l:l, 'guibg=' . a:bg[1])
        endif
    endif

    if a:style != ''
        let l:l = add(l:l, 'cterm=' . a:style)
        let l:l = add(l:l, 'gui=' . a:style)
    endif

    let l:cmd = join(l:l, ' ')
    execute l:cmd
endfunction
