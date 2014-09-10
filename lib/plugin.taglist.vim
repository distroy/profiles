"
" Copyright (C) distroy
"


if g:ld_tagshow != 'taglist'
    finish
endif


nnoremap <silent> <S-F12> :TlistUpdate<CR>
nnoremap <silent> <F12> :Tlist<CR>
nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

setlocal tags=tags
setlocal tags+=./tags
setlocal tags+=/usr/include/tags


let g:Tlist_Show_One_File       = 1
let g:Tlist_Exit_OnlyWindow     = 1
let g:Tlist_File_Fold_Auto_Close    = 1
let g:Tlist_Auto_Open           = 1
let g:Tlist_Auto_Update         = 1
"let g:Tlist_GainFocus_On_ToggleOpen     = 1
"let g:Tlist_WinHeight           = 40
let g:Tlist_WinWidth            = 40
"let g:Tlist_Show_Menu           = 1
"let g:Tlist_Use_Right_Window    = 1


