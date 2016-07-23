"
" Copyright (C) distroy
"


set number

highlight Directory ctermfg = blue

set cursorline
highlight CursorLineNr  ctermbg = darkred
highlight CursorLine    cterm = none
set scrolloff=5

set nowrap
set list
set listchars=tab:>·,trail:·
highlight SpecialKey ctermfg = darkgray

set colorcolumn=81
set textwidth=0
highlight ColorColumn ctermbg = red ctermfg = white


autocmd BufWritePre * call <SID>trim_tail_space()


" over length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


function! s:trim_tail_space()
    let l:pos = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
