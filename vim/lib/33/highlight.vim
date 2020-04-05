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

call g:ld.highlight("Normal", g:LD.COLOR.WHITE, g:LD.COLOR.GREY0, "NONE")
call g:ld.highlight("LineNr", g:LD.COLOR.GRAY7, g:LD.COLOR.GRAY1, "NONE")
call g:ld.highlight("Comment", g:LD.COLOR.GRAY_PURPLE, g:LD.COLOR.NONE, "NONE")
call g:ld.highlight("Directory", g:LD.COLOR.LIGHT_BLUE, g:LD.COLOR.NONE, "NONE")
call g:ld.highlight("Folded", g:LD.COLOR.MINT, g:LD.COLOR.GRAY3, "NONE")
" call g:ld.highlight("StatusLine", g:LD.COLOR.WHITE, g:LD.COLOR.GREY0, "NONE")
call g:ld.highlight("Pmenu", g:LD.COLOR.WHITE, g:LD.COLOR.GRAY3, "NONE")
call g:ld.highlight("PmenuSel", g:LD.COLOR.HOT_PINK, g:LD.COLOR.GRAY1, "NONE")
