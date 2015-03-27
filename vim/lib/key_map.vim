"
" Copyright (C) distroy
"


nnoremap <F3> :exec ':grep' '-rnIw' '--exclude-dir={.git,.hg,.svn}' '--exclude={tags,".*.swp"}' expand('<cword>') '*'<CR><CR> :cw <CR>
nnoremap <F4> :grep -nI --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp"}<Space>
nnoremap <F5> :A<CR>

nnoremap <F7> gT
nnoremap <F8> gt

nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

