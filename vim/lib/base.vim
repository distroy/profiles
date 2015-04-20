"
" Copyright (C) distroy
"


set number

highlight Directory ctermfg = blue

set cursorline
highlight CursorLineNr ctermfg = DarkRed
highlight CursorLine cterm = None
set scrolloff=3

set nowrap
set list
set listchars=tab:>·,trail:·
highlight SpecialKey ctermfg = DarkGray


autocmd BufWritePre * call <SID>trim_tail_space()

" over length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


function! s:trim_tail_space()
    let l:pos = getcurpos()
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
