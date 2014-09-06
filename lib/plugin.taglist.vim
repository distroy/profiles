"
" Copyright (C) distroy
"


nnoremap <F12> :TlistUpdate<CR>
inoremap <F12> <ESC>:TlistUpdate<CR>

nnoremap <S-F12> :Tlist<CR>
inoremap <S-F12> <ESC>:Tlist<CR>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

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


