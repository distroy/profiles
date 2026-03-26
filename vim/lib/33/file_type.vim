"
" Copyright (C) distroy
"


syntax on
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro
set noautoindent


augroup ld_file_type
    autocmd BufNew * normal zR
augroup end


" set file type
" autocmd BufEnter *.vue set filetype=html
