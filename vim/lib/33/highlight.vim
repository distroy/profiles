"
" Copyright (C) distroy
"


if !has('gui_running')
  set t_Co=256
endif

" colorscheme


highlight Directory ctermfg=blue
highlight Visual cterm=reverse ctermbg=none
highlight Search cterm=none ctermbg=3 ctermfg=0

highlight LineNr ctermfg=3


" cursor
highlight CursorLineNr ctermbg=darkred ctermfg=3
highlight CursorLine cterm=none guibg=NONE

highlight SpecialKey ctermfg=darkgray
highlight Whitespace ctermfg=darkgray

highlight ColorColumn ctermbg=red ctermfg=white


" status line
highlight WildMenu ctermfg=black ctermbg=yellow
highlight StatusLine cterm=bold ctermfg=white ctermbg=238


" file
highlight Comment ctermfg=blue

highlight Folded ctermbg=darkgray ctermfg=darkgreen
