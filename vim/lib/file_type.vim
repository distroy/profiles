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
set foldnestmax=20
" set foldlevel=1
autocmd BufEnter * normal zR

highlight Folded ctermbg = darkgray ctermfg = darkgreen


" autocmd FileType javascript setlocal foldmethod=marker | setlocal foldmarker={,}
autocmd FileType html       setlocal foldmethod=indent
autocmd FileType python     setlocal foldmethod=indent


" set file type
autocmd BufEnter *.vue set filetype=html


command -nargs=+ -complete=dir CAppendTags call <SID>append_tags(<f-args>)
command -nargs=1 CSetTab call <SID>set_tab(<args>)


function! s:set_tab(w)
    let l:w = a:w
    let &l:tabstop      = l:w
    let &l:shiftwidth   = l:w
    let &l:softtabstop  = l:w
endfunction


function! s:append_tags(...)
    if &l:tags == ''
        let &l:tags .= 'tags'
    endif
    let l:paths = join(a:000, ',')
    let &l:tags .= ',' . l:paths
endfunction
