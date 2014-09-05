"
" Copyright (C) distroy
"

set noautoindent
set expandtab
autocmd FileType * set formatoptions-=cro

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

" filetype
filetype on
filetype plugin on
filetype indent on


" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
setlocal tags=tags
setlocal tags+=./tags
setlocal tags+=/usr/include/tags


" taglist
let Tlist_Show_One_File     = 1
let Tlist_Exit_OnlyWindow   = 1
let Tlist_File_Fold_Auto_Close  = 1
let Tlist_Auto_Open         = 1
let Tlist_Auto_Update       = 1
"let Tlist_GainFocus_On_ToggleOpen   = 1
"let Tlist_WinHeight         = 40
let Tlist_WinWidth          = 40
"let Tlist_Show_Menu         = 1
"let Tlist_Use_Right_Window  = 1


" super tab
let g:SuperTabRetainCompletionType  = 2
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"      " Omni completion
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"     " User defined completion


" neocomplete

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
if has('lua')
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
        let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif


if has('autocmd')
    autocmd BufNewFile *.[ch]pp,*.[ch] exec ':call s:ld_nf_c(0)'
    autocmd BufNewFile *.java exec ':call s:ld_nf_c(0)'
    autocmd BufNewFile *.sh exec ':call s:ld_nf_shell(0)'
    autocmd BufNewFile *.py exec ':call s:ld_nf_python(0)'
endif


function! s:ld_append(line, text)
    if a:line < 0 || append(a:line, a:text) != 0
        return -1
    endif

    return a:line + 1
endfunction


function! s:ld_nf_c(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '/*')
    let l:l = s:ld_append(l:l, ' * Copyright (C) distroy')
    let l:l = s:ld_append(l:l, ' */')
    let l:l = s:ld_append(l:l, '')

    if expand("%:e") == 'h'
        let l:l = s:ld_append(l:l, '#ifndef __LOLY_H__')
        let l:l = s:ld_append(l:l, '#define __LOLY_H__')
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '#endif /* __LOLY_H__ */')
    endif

    autocmd BufNewFile * normal G
    return l:l
endfunction


function! s:ld_shell_header(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '#')
    let l:l = s:ld_append(l:l, '# Copyright (C) distroy')
    let l:l = s:ld_append(l:l, '#')

    return l:l
endfunction


function! s:ld_nf_shell(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '#!/bin/bash')
    let l:l = s:ld_shell_header(l:l)
    let l:l = s:ld_append(l:l, '')

    autocmd BufNewFile * normal G
    return l:l
endfunction


function! s:ld_nf_python(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '#!/usr/bin/env python')
    let l:l = s:ld_append(l:l, '# -*- coding: utf-8 -*-')
    let l:l = s:ld_shell_header(l:l)
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'import sys')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'def main(argc, argv):')
    let l:l = s:ld_append(l:l, '    return 0')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'if __name__ == "__main__":')
    let l:l = s:ld_append(l:l, '    exit(main(len(sys.argv), sys.argv))')

    autocmd BufNewFile * normal G
    return l:l
endfunction


function! s:ld_set_tab(w)
    let l:w = a:w
    let &l:tabstop      = l:w
    let &l:shiftwidth   = l:w
    let &l:softtabstop  = l:w
endfunction


