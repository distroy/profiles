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

highlight Comment ctermfg = blue
highlight Directory ctermfg = blue

set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set showcmd
set cursorline
set scrolloff=3

set nowrap
set list
set listchars=tab:>·,trail:·
highlight SpecialKey ctermfg = DarkGray

set noautoindent

set laststatus=2

" over length
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

