"
" Copyright (C) distroy
"


call ld#set_tags('tags')
" call ld#set_tags('./tags')


filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro


set foldmethod=syntax
set nofoldenable
set foldnestmax=3
" set foldlevel=1

highlight Folded ctermbg = darkgray ctermfg = darkgreen


autocmd FileType javascript setlocal foldmethod=marker | setlocal foldmarker={,}
autocmd FileType html       setlocal foldmethod=indent | setlocal wrap

