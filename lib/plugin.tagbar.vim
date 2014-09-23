"
" Copyright (C) distroy
"


if g:ld_tagshow != 'tagbar'
    finish
endif


nnoremap <silent> <F2> :TagbarToggle<CR>


let g:tagbar_autoclose          = 1
let g:tagbar_autofocus          = 1
let g:tagbar_autopreview        = 0
let g:tagbar_autoshowtag        = 1
let g:tagbar_ctags_bin          = 'ctags'
let g:tagbar_foldlevel          = 99
let g:tagbar_indent             = 2
let g:tagbar_left               = 1
let g:tagbar_sort               = 1
let g:tagbar_show_linenumbers   = 0
let g:tagbar_width              = 40


"autocmd VimEnter * nested :call tagbar#autoopen(1)

