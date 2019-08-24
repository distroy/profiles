"
" Copyright (C) distroy
"


if !g:ld.plug.has('undotree') | finish | endif


nnoremap <f4> :UndotreeToggle<cr>

let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_RelativeTimestamp = 0
" let g:undotree_ShortIndicators = 1
