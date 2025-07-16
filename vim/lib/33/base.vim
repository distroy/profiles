"
" Copyright (C) distroy
"


set number

" mouse
set mouse= " default: nvi
" set selectmode=key,cmd

" cursor
set cursorline
set scrolloff=5

set nowrap
if version > 730
    set list
    set listchars=tab:>·,trail:·
endif

if version > 730
    set colorcolumn=81
endif
set textwidth=0


autocmd BufWritePre * call <SID>trim_tail_space()
autocmd TabClosed * tabprevious

function! s:trim_tail_space()
    let l:pos = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
