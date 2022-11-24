"
" Copyright (C) distroy
"


if !g:ld.plug.has('vim-anyfold') | finish | endif


autocmd Filetype vim AnyFoldActivate
autocmd Filetype html AnyFoldActivate
autocmd Filetype python AnyFoldActivate
" highlight Folded term=NONE cterm=NONE

let g:anyfold_fold_display  = 0
let g:anyfold_motion = 0
let g:anyfold_identify_comments = 1
let g:anyfold_fold_comments = 1

let g:anyfold_fold_toplevel = 0
" let g:anyfold_fold_size_str = '%s lines'
" let g:anyfold_fold_level_str = ' + '

call ld.setnx('ld.fold', {})

set foldtext=ld.fold.text()

function! ld.fold.text() abort
    let l:fold_size_str = '%s lines'
    let l:fold_level_str = '+'

    let l:fs = v:foldstart
    while getline(l:fs) !~ '\w'
        let l:fs = nextnonblank(l:fs + 1)
    endwhile
    if l:fs > v:foldend
        let l:line = getline(v:foldstart)
    else
        let l:line = getline(l:fs)
        let l:line = substitute(l:line, '\t', repeat(' ', &tabstop), 'g')
    endif

    let l:fold_size = 1 + v:foldend - v:foldstart
    let l:fold_size_str = " " . substitute(l:fold_size_str, "%s", string(l:fold_size), "g") . " "
    let l:fold_level = v:foldlevel
    let l:fold_level_str = repeat(l:fold_level_str, l:fold_level) . ' '

    let l:line_trimed = trim(l:line, 1)
    let l:prefix_width = strwidth(l:line) - strwidth(l:line_trimed)

    let l:fill_str = ''
    if l:prefix_width > strwidth(l:fold_level_str)
        let l:fill_str = repeat(' ', l:prefix_width - strwidth(l:fold_level_str))
    endif

    return l:fold_level_str . l:fill_str . l:line_trimed . l:fold_size_str . ' '

    " let l:width = winwidth(0) - &foldcolumn - &number * &numberwidth
    " let l:width = l:width - 1
    " let l:width = l:width - strwidth(l:fold_size_str)
    " let l:width = l:width - strwidth(l:line)
    " let l:width = l:width - strwidth(l:fold_level_str)
    " let l:expansionString = repeat(" ", l:width)
    " return l:line . l:expansionString . l:fold_size_str . l:fold_level_str
endfunction
