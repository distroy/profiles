"
" Copyright (C) distroy
"


if !has('gui_running')
  set t_Co=256
endif


set number

highlight Directory ctermfg = blue
highlight Visual cterm=reverse ctermbg=none
highlight Search cterm=none ctermbg=3 ctermfg=0

highlight LineNr ctermfg = 3

set cursorline
highlight CursorLineNr ctermbg=darkred ctermfg=3
highlight CursorLine cterm=none guibg=NONE
set scrolloff=5

set nowrap
set list
set listchars=tab:>·,trail:·
highlight SpecialKey ctermfg = darkgray

if version > 730
    set colorcolumn=81
endif
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
