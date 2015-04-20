"
" Copyright (C) distroy
"


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent

highlight Comment ctermfg = blue


set foldmethod=syntax
set nofoldenable
set foldnestmax=3
" set foldlevel=1
autocmd BufRead * normal zR

highlight Folded ctermbg = darkgray ctermfg = darkgreen


autocmd FileType javascript setlocal foldmethod=marker | setlocal foldmarker={,}
autocmd FileType html       setlocal foldmethod=indent
autocmd FileType python     setlocal foldmethod=indent


function! s:set_tab(w)
    let l:w = a:w
    let &l:tabstop      = l:w
    let &l:shiftwidth   = l:w
    let &l:softtabstop  = l:w
endfunction


function! s:set_tags(path)
    if &l:tags == ''
        let &l:tags .= 'tags'
    endif
    let &l:tags .= ',' . a:path
endfunction
