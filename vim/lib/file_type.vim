"
" Copyright (C) distroy
"


call ld#set_tags('tags')
" call ld#set_tags('./tags')


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent

highlight Comment ctermfg = blue


set foldmethod=syntax
set nofoldenable
set foldnestmax=3
" set foldlevel=1
autocmd BufRead * normal zR

highlight Folded ctermbg = darkgray ctermfg = darkgreen


autocmd FileType javascript setlocal foldmethod=marker | setlocal foldmarker={,}
autocmd FileType html       setlocal foldmethod=indent
autocmd FileType python     setlocal foldmethod=indent
