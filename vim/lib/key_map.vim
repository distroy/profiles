"
" Copyright (C) distroy
"


" vertical help
nnoremap <F1> :execute printf(':vertical help %s', expand('<cword>'))<CR>


" tab move
nnoremap <F7> gT
nnoremap <F8> gt


" ctags
nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


" window move
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
