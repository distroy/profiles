"
" Copyright (C) distroy
"


if has('autocmd')
    autocmd BufNewFile *.[ch]pp,*.[ch] exec ':call s:ld_c(0)'
    autocmd BufNewFile *.java exec ':call s:ld_c(0)'
    autocmd BufNewFile *.sh exec ':call s:ld_shell(0)'
    autocmd BufNewFile *.py exec ':call s:ld_python(0)'
    autocmd BufNewFile *.vim exec ':call s:ld_vim(0)'
endif


function! s:ld_append(line, text)
    if a:line < 0 || append(a:line, a:text) != 0
        return -1
    endif

    return a:line + 1
endfunction


function! s:ld_c(line)
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


function! s:ld_shell(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '#!/bin/bash')
    let l:l = s:ld_shell_header(l:l)
    let l:l = s:ld_append(l:l, '')

    autocmd BufNewFile * normal G
    return l:l
endfunction


function! s:ld_python(line)
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


function! s:ld_vim(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '"')
    let l:l = s:ld_append(l:l, '" Copyright (C) distroy')
    let l:l = s:ld_append(l:l, '"')

    return l:l
endfunction


