"
" Copyright (C) distroy
"


if g:ld_tagshow != 'tagbar'
    finish
endif


nnoremap <silent> <F12> :TagbarToggle<CR>
nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


let g:tagbar_autofocus          = 0
let g:tagbar_autopreview        = 1
let g:tagbar_autoshowtag        = 1
let g:tagbar_ctags_bin          = 'ctags'
let g:tagbar_foldlevel          = 99
let g:tagbar_indent             = 2
let g:tagbar_left               = 1
let g:tagbar_sort               = 1
let g:tagbar_show_linenumbers   = 0
let g:tagbar_width              = 40


autocmd VimEnter * nested :call tagbar#autoopen(1)

