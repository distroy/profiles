"
" Copyright (C) distroy
"


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent

highlight Comment ctermfg = blue


set foldmethod=syntax
set nofoldenable
set foldnestmax=20
" set foldlevel=1
autocmd BufRead * normal zR

highlight Folded ctermbg = darkgray ctermfg = darkgreen


autocmd FileType html       setlocal foldmethod=indent
autocmd FileType python     setlocal foldmethod=indent


" set file type
" autocmd BufEnter *.vue set filetype=html
