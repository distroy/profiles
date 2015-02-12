"
" Copyright (C) distroy
"


let g:ld_copyright = ['Copyright (C) ' . g:ld_user]


if has('autocmd')
    autocmd BufNewFile *.[ch]pp,*.[ch] exec ':call s:ld_c(0)'
    autocmd BufNewFile *.java exec ':call s:ld_c(0)'
    autocmd BufNewFile *.sh exec ':call s:ld_shell(0)'
    autocmd BufNewFile *.py exec ':call s:ld_python(0)'
    autocmd BufNewFile *.vim exec ':call s:ld_vim(0)'
    autocmd BufNewFile *.php exec ':call s:ld_php(0)'
endif


function! s:ld_append(line, text)
    if a:line < 0 || append(a:line, a:text) != 0
        return -1
    endif

    return a:line + 1
endfunction


function! s:ld_file_info(line, ...)
    let l:l = a:line

    if a:0 == 1
        let l:start = a:1
        let l:end = a:1
        let l:prefix = a:1
    elseif a:0 == 3
        let l:start = a:1
        let l:end = a:2
        let l:prefix = a:3
    else
        echomsg 'error: invalid paramters of ld_file_info: ' . a:0
        return l:l
    endif

    let l:prefix = l:prefix . ' '

    let l:l = s:ld_append(l:l, l:start)
    for l:info in g:ld_copyright
        let l:l = s:ld_append(l:l, l:prefix . l:info)
    endfor
    let l:l = s:ld_append(l:l, l:end)

    return l:l
endfunction


function! s:ld_c(line)
    let l:l = a:line

    let l:l = s:ld_file_info(l:l, '/*', ' */', ' *')
    let l:l = s:ld_append(l:l, '')

    if expand("%:e") == 'h'
        let l:l = s:ld_append(l:l, '#ifndef __LOLY_H__')
        let l:l = s:ld_append(l:l, '#define __LOLY_H__')
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '#endif /* __LOLY_H__ */')
    endif

    return l:l
endfunction


function! s:ld_shell(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '#!/bin/bash')
    let l:l = s:ld_file_info(l:l, '#')
    let l:l = s:ld_append(l:l, '')

    return l:l
endfunction


function! s:ld_python(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '#!/usr/bin/env python')
    let l:l = s:ld_append(l:l, '# -*- coding: utf-8 -*-')
    let l:l = s:ld_file_info(l:l, '#')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'def get_options():')
    let l:l = s:ld_append(l:l, '    import optparse')
    let l:l = s:ld_append(l:l, '    parser = optparse.OptionParser(version = "%prog ('. g:ld_user .') 0.1")')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '    opts, args = parser.parse_args()')
    let l:l = s:ld_append(l:l, '    return opts, args')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'def main(opts, args):')
    let l:l = s:ld_append(l:l, '    return 0')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'if __name__ == "__main__":')
    let l:l = s:ld_append(l:l, '    (opts, args) = get_options()')
    let l:l = s:ld_append(l:l, '    exit(main(opts, args))')

    return l:l
endfunction


function! s:ld_vim(line)
    let l:l = a:line

    let l:l = s:ld_file_info(l:l, '"')

    return l:l
endfunction


function! s:ld_php(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '<?php')
    let l:l = s:ld_file_info(l:l, '#')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '?>')

    return l:l
endfunction


