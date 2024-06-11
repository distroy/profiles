"
" Copyright (C) distroy
"


if !has('gui_running')
  set t_Co=256
endif

" colorscheme


" highlight Directory ctermfg=blue
" highlight Visual cterm=reverse ctermbg=none
highlight Search cterm=none ctermbg=3 ctermfg=0

" highlight LineNr ctermfg=3


" cursor
" highlight CursorLineNr ctermbg=darkred ctermfg=3
" highlight CursorLine cterm=none guibg=NONE

" highlight SpecialKey ctermfg=darkgray
" highlight Whitespace ctermfg=darkgray

" highlight ColorColumn ctermbg=red ctermfg=white


" status line
highlight WildMenu ctermfg=black ctermbg=yellow
highlight StatusLine cterm=bold ctermfg=white ctermbg=238


" file
highlight Comment ctermfg=blue

" highlight Folded ctermbg=darkgray ctermfg=darkgreen

call g:ld.highlight('Normal', g:LD.COLOR.WHITE, g:LD.COLOR.BLACK, "NONE")
call g:ld.highlight('LineNr', g:LD.COLOR.GRAY7, g:LD.COLOR.GRAY1, "NONE")
call g:ld.highlight('Comment', [146, '#afb0d9'], g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('Directory', g:LD.COLOR.LIGHT_BLUE, g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('Folded', 158, [239, g:LD.COLOR.NVIM.NvimDarkGrey3], "NONE")

" call g:ld.highlight('StatusLine', g:LD.COLOR.WHITE, g:LD.COLOR.GREY0, "NONE")
call g:ld.highlight('Pmenu', g:LD.COLOR.WHITE, g:LD.COLOR.GRAY3, "NONE")
call g:ld.highlight('PmenuSel', g:LD.COLOR.HOT_PINK, g:LD.COLOR.GRAY1, "NONE")
call g:ld.highlight('NormalFloat', '', g:LD.COLOR.GRAY3, "NONE")
" call g:ld.highlight('FloatBorder', g:LD.COLOR.WHITE, g:LD.COLOR.GRAY0, "NONE")


" nvim color
call g:ld.highlight('Visual', 'NONE', g:LD.COLOR.NVIM.NvimDarkGrey4, "")
call g:ld.highlight('CursorLine', g:LD.COLOR.NONE, g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('CursorLineNr', [3, '#ffff00'], ['darkred', '#bb1111'], "BOLD")

call g:ld.highlight('Special', [224, '#ffd5d7'], g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('SpecialKey', ['darkgray', '#666666'], g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('Whitespace', ['darkgray', '#666666'], g:LD.COLOR.NONE, "NONE")
call g:ld.highlight('ColorColumn', 'NONE', g:LD.COLOR.NVIM.NvimDarkGrey4, "")

call g:ld.highlight('Statement', [11, '#fefa72'], '', "BOLD")
call g:ld.highlight('Operator', [11, '#fefa72'], '', "BOLD")
call g:ld.highlight('PreProc', [81, '#14dbff'], '', "")
call g:ld.highlight('Type', [121, '#5fffac'], '', "BOLD")
call g:ld.highlight('Function', [14, '#64f2f3'], '', "BOLD")
call g:ld.highlight('Identifier', [14, '#64f2f3'], '', "BOLD")
call g:ld.highlight('String', [13, '#ff7cfd'], '', "NONE")
call g:ld.highlight('Constant', [13, '#ff7cfd'], '', "NONE")
