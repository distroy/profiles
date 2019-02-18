"
" Copyright (C) distroy
"


" check the plugins which use
if !exists('g:ld_tagshow')
    if version >= 800 && (has('python') || has('python3'))
        let g:ld_tagshow = 'leaderf'
    else
        let g:ld_tagshow = 'tagbar'
    endif
endif


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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'distroy/vim-matchit'
Plug 'vim-syntastic/syntastic'
Plug 'mattn/emmet-vim', {'for': ['html', 'xml']}
" Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']}
Plug 'groenewege/vim-less', {'for': ['less']}
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] }

if g:ld_tagshow == 'leaderf'
    if has('win32')
        Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
    else
        Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
    endif
else
    Plug 'kien/ctrlp.vim'
    Plug 'majutsushi/tagbar'
    " Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
endif

if version > 800
    Plug 'ludovicchabant/vim-gutentags'
endif

if has('lua')
    " Plugin 'Shougo/neocomplete.vim'
endif
if version >= 740
    Plug 'Valloric/YouCompleteMe'
endif

" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'a.vim', {'on': 'A'}


call plug#end()            " required

" filetype plugin indent on    " required
