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


autocmd BufWritePre * call ld#hook_pre_save()

" over length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
