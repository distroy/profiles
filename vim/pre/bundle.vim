"
" Copyright (C) distroy
"

set nocompatible              " be iMproved, required
filetype off                  " required

let &rtp .= ',' . g:ld_vim_path . '/bundle/Vundle.vim'
call vundle#begin(g:ld_vim_path . '/bundle')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'         " fugitive
Plugin 'tpope/vim-surround'         " surround
Plugin 'Shougo/neocomplete.vim'     " neocomplete
Plugin 'kien/ctrlp.vim'             " ctrlp
Plugin 'bling/vim-airline'          " airline
Plugin 'tomtom/tcomment_vim'        " tcomment
Plugin 'mkitt/tabline.vim'          " tabline
Plugin 'scrooloose/nerdtree'        " nerdtree
Plugin 'majutsushi/tagbar'          " tagbar
Plugin 'Yggdroot/indentLine'        " indentLine
Plugin 'edsono/vim-matchit'         " matchit
Plugin 'Raimondi/delimitMate'       " delimitMate

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'a.vim'
Plugin 'SuperTab'
Plugin 'gitv'


call vundle#end()            " required

filetype plugin indent on    " required
