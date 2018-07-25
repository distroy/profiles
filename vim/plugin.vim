"
" Copyright (C) distroy
"

" set nocompatible              " be iMproved, required
" filetype off                  " required

" exec 'source' g:ld_vim_path . '/plugin/vim-plug/plug.vim'
exec 'source' g:ld_vim_path . '/plugin/plug.vim'
call plug#begin(g:ld_vim_path . '/plugin')


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/lightline.vim'
" Plug 'Yggdroot/indentLine'
Plug 'tomtom/tcomment_vim'
" Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'kien/ctrlp.vim'
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'distroy/vim-matchit'
Plug 'mattn/emmet-vim', {'for': ['html', 'xml']}
" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'groenewege/vim-less', {'for': ['less']}
Plug 'mbbill/undotree'
Plug 'ludovicchabant/vim-gutentags'

if has('lua')
    " Plugin 'Shougo/neocomplete.vim'
endif
Plug 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'a.vim', {'on': 'A'}


call plug#end()            " required

" filetype plugin indent on    " required
