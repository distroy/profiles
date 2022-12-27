"
" Copyright (C) distroy
"


if !g:ld.plug.has('vim-anyfold') | finish | endif


autocmd Filetype vim AnyFoldActivate
autocmd Filetype yaml AnyFoldActivate
autocmd Filetype html AnyFoldActivate
autocmd Filetype python AnyFoldActivate
" highlight Folded term=NONE cterm=NONE

let g:anyfold_fold_display  = 0
let g:anyfold_motion = 0
let g:anyfold_identify_comments = 1
let g:anyfold_fold_comments = 1

let g:anyfold_fold_toplevel = 0
" let g:anyfold_fold_size_str = '%s lines'
" let g:anyfold_fold_level_str = ' + '
