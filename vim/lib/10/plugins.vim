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

if has('nvim')
    if !has('timers') || !has('nvim-0.2.0')
        call g:ld.plug.disable('ale')
    endif
else
    if !has('timers') || !exists('*job_start') || !exists('*ch_close_in')
        call g:ld.plug.disable('ale')
    endif
endif

if version <= 740
    call g:ld.plug.disable('YouCompleteMe')
endif
if version < 800
    call g:ld.plug.disable('vim-go', 'vim-gutentags', 'coc.nvim')
    call g:ld.plug.disable('echodoc.vim')
endif
if has('lua')
    call g:ld.plug.disable('neocomplete.vim')
endif
if executable('node') <= 0
    call g:ld.plug.disable('coc.nvim')
endif

call g:ld.plug.disable('YouCompleteMe')
call g:ld.plug.disable('neocomplete.vim')
" call g:ld.plug.disable('vim-go')


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
" call s:add('distroy/vim-matchit')
call s:add('andymass/vim-matchup')
" call s:add('vim-syntastic/syntastic')
call s:add('dense-analysis/ale')
call s:add('preservim/vim-markdown', {'for': ['markdown']})
call s:add('iamcco/markdown-preview.nvim', {
    \ 'for': ['markdown', 'vim-plug'],
    \ 'on': ['MarkdownPreview'],
    \ 'do': { -> mkdp#util#install() },
    \ })
call s:add('mattn/emmet-vim', {'for': ['html', 'xml']})
" call s:add('jelera/vim-javascript-syntax')
call s:add('pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx', 'typescript']})
call s:add('posva/vim-vue', {'for': 'vue'})
call s:add('MaxMEllon/vim-jsx-pretty', {'for': ['javascript', 'javascript.jsx', 'typescript']})
call s:add('groenewege/vim-less', {'for': ['less']})
call s:add('mbbill/undotree')
" call s:add('Raimondi/delimitMate') " auto close
call s:add('fatih/vim-go', {
    \ 'on': 'GoUpdateBinaries',
    \ 'for': ['go', 'gomod', 'gosum'],
    \ })
" call s:add('ludovicchabant/vim-gutentags')

call s:add('Yggdroot/LeaderF', {
    \ 'win': { 'do': '.\install.bat' },
    \ 'unix': { 'do': './install.sh' },
    \ })

call s:add('kien/ctrlp.vim')
call s:add('majutsushi/tagbar')
" call s:add('majutsushi/tagbar', {'on': 'TagbarToggle'})

call s:add('pseewald/vim-anyfold')


call s:add('Shougo/neocomplete.vim')
call s:add('Valloric/YouCompleteMe', {
    \ 'do': './install.py --enable-coverage --ts-completer --clang-completer --go-completer'
    \ })
call s:add('neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' })
" call s:add('neoclide/coc.nvim', {'do': { -> coc#util#install()}})

" plugin from http://vim-scripts.org/vim/scripts.html
" call s:add('a.vim', {'on': 'A'})


call g:ld.plug.end()
