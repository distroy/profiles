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


" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=/usr/include/tags


" taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_WinHeight = 40
let Tlist_WinWidth = 40
"let Tlist_Show_Menu = 1
"let Tlist_Use_Right_Window = 1


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
    let l:l = s:ld_append(l:l, 'def main(argc, argv):')
    let l:l = s:ld_append(l:l, '    return 0')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'if __name__ == "__main__":')
    let l:l = s:ld_append(l:l, '    import sys')
    let l:l = s:ld_append(l:l, '    exit(main(len(sys.argv), sys.argv))')

    autocmd BufNewFile * normal G
    return l:l
endfunction


