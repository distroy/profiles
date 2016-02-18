"
" Copyright (C) distroy
"

set nocompatible              " be iMproved, required
filetype off                  " required

let &runtimepath .= ',' . g:ld_vim_path . '/plugin/Vundle.vim'
call vundle#begin(g:ld_vim_path . '/plugin')


" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'         " fugitive
Plugin 'tpope/vim-surround'         " surround
Plugin 'tpope/vim-repeat'           " repeat
Plugin 'kien/ctrlp.vim'             " ctrlp
Plugin 'vim-airline/vim-airline'    " airline
Plugin 'vim-airline/vim-airline-themes'     " airline themes
Plugin 'tomtom/tcomment_vim'        " tcomment
" Plugin 'mkitt/tabline.vim'          " tabline
Plugin 'scrooloose/nerdtree'        " nerdtree
Plugin 'majutsushi/tagbar'          " tagbar
Plugin 'Yggdroot/indentLine'        " indentLine
" Plugin 'edsono/vim-matchit'         " matchit
" Plugin 'mattn/emmet-vim'            " emmet
" Plugin 'jelera/vim-javascript-syntax'   " javascript
" Plugin 'pangloss/vim-javascript'    " javascript

if has('lua')
    " Plugin 'Shougo/neocomplete.vim' " neocomplete
endif
Plugin 'Valloric/YouCompleteMe'     " ycm

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'a.vim'
Plugin 'gitv'


call vundle#end()            " required

filetype plugin indent on    " required
