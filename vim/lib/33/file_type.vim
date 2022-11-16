"
" Copyright (C) distroy
"


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent


set foldmethod=syntax
set nofoldenable
set foldnestmax=20
" set foldlevel=1
autocmd BufRead * normal zR


" autocmd FileType html       setlocal foldmethod=indent
" autocmd FileType python     setlocal foldmethod=indent


" set file type
" autocmd BufEnter *.vue set filetype=html
