"
" Copyright (C) distroy
"


set expandtab

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4

set backspace=indent,eol,start

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,big5,euc-jp,euc-kr,latin1

syntax on
"set foldmethod=syntax

set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set showcmd
"set cursorline
set scrolloff=3

set list
set listchars=tab:>-,trail:-
set nowrap

set noautoindent

" filetype
filetype on
filetype plugin on
filetype indent off
autocmd FileType * set formatoptions-=cro


nnoremap <F3> :exec ':grep' '-rnw' '--exclude=tags' expand('<cword>') '*'<CR><CR> :cl <CR>
nnoremap <F4> :grep -n --exclude=tags<Space>
nnoremap <F5> :e<CR>

nnoremap <silent> <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

