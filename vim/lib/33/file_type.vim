"
" Copyright (C) distroy
"


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent


autocmd BufRead * normal zR


" set file type
" autocmd BufEnter *.vue set filetype=html
