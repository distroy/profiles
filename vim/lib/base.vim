"
" Copyright (C) distroy
"


set number

highlight Directory ctermfg = blue

set cursorline
set scrolloff=3

set nowrap
set list
set listchars=tab:>·,trail:·
highlight SpecialKey ctermfg = DarkGray


autocmd BufWritePre * %s/\s\+$//e

" over length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

