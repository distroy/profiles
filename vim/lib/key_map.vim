"
" Copyright (C) distroy
"

nnoremap <F1> :exec printf(':vertical help %s', expand('<cword>'))<CR>

nnoremap <F3>p :call ld#grep(1, '-rwI', ld#curr_word(), '*')<CR><CR>:cw<CR>
nnoremap <F3>l :call ld#grep(0, '-rwI', ld#curr_word(), ld#curr_file())<CR><CR>:cw<CR>
vnoremap <F3>p :<c-u>call ld#grep(1, '-rI', ld#get_selection(), '*')<CR><CR>:cw<CR>
vnoremap <F3>l :<c-u>call ld#grep(0, '-rI', ld#get_selection(), ld#curr_file())<CR><CR>:cw<CR>
nnoremap <F3>i :grep --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp"} -I<Space>


nnoremap <F4> :A<CR>

nnoremap <F7> gT
nnoremap <F8> gt

nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

