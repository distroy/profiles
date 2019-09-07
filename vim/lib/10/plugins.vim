"
" Copyright (C) distroy
"


call g:ld.plug.reset()

" check the plugins which use
if version >= 800 && (has('python') || has('python3'))
    call g:ld.plug.disable('ctrlp.vim', 'tagbar')
else
    call g:ld.plug.disable('LeaderF')
endif

if version <= 740
    call g:ld.plug.disable('YouCompleteMe')
endif
if version < 800
    call g:ld.plug.disable('vim-go', 'vim-gutentags', 'coc.nvim')
endif
if has('lua')
    call g:ld.plug.disable('neocomplete.vim')
endif

call g:ld.plug.disable('YouCompleteMe')
call g:ld.plug.disable('neocomplete.vim')


function! s:add(n, ...)
    if a:0 == 0
        call g:ld.plug.add(a:n)
    else
        call g:ld.plug.add(a:n, a:1)
    endif
endfunction


call g:ld.plug.begin()


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
call s:add('tpope/vim-fugitive')
call s:add('tpope/vim-surround')
call s:add('tpope/vim-repeat')
call s:add('itchyny/lightline.vim')
" call s:add('Yggdroot/indentLine')
call s:add('Shougo/echodoc.vim')
call s:add('tomtom/tcomment_vim')
call s:add('scrooloose/nerdtree', {'on': 'NERDTreeToggle'})
call s:add('Chiel92/vim-autoformat', {'on': 'Autoformat'})
call s:add('distroy/vim-matchit')
" call s:add('vim-syntastic/syntastic')
call s:add('dense-analysis/ale')
call s:add('mattn/emmet-vim', {'for': ['html', 'xml']})
" call s:add('jelera/vim-javascript-syntax')
call s:add('pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']})
call s:add('posva/vim-vue', {'for': 'vue'})
call s:add('mxw/vim-jsx', {'for': ['javascript', 'javascript.jsx']})
call s:add('groenewege/vim-less', {'for': ['less']})
call s:add('mbbill/undotree')
" call s:add('Raimondi/delimitMate') " auto close
call s:add('fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go'] })
call s:add('ludovicchabant/vim-gutentags')

call s:add('Yggdroot/LeaderF', {
    \ 'win': { 'do': '.\install.bat' },
    \ 'unix': { 'do': './install.sh' },
    \ })

call s:add('kien/ctrlp.vim')
call s:add('majutsushi/tagbar')
" call s:add('majutsushi/tagbar', {'on': 'TagbarToggle'})


call s:add('Shougo/neocomplete.vim')
call s:add('Valloric/YouCompleteMe', { 'do': './install.py --enable-coverage --ts-completer --clang-completer --go-completer' })
call s:add('neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' })
" call s:add('neoclide/coc.nvim', {'do': { -> coc#util#install()}})

" plugin from http://vim-scripts.org/vim/scripts.html
" call s:add('a.vim', {'on': 'A'})


call g:ld.plug.end()
