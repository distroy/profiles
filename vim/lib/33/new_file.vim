"
" Copyright (C) distroy
"


augroup ld.new_files
    autocmd BufNewFile *.[ch]pp     call s:nf_c_family(0)
    autocmd BufNewFile *.[ch]       call s:nf_c_family(0)
    autocmd BufNewFile *.go         call s:nf_golang(0)
    autocmd BufNewFile *.proto      call s:nf_protobuf(0)

    autocmd BufNewFile *.java       call s:nf_c_family(0)

    autocmd BufNewFile *.php        call s:nf_php(0)

    autocmd BufNewFile *.sh         call s:nf_shell(0, 'bash')
    autocmd BufNewFile *.bash       call s:nf_shell(0, 'bash')
    autocmd BufNewFile *.zsh        call s:nf_shell(0, 'zsh')

    autocmd BufNewFile [Mm]akefile  call s:nf_shell(0, '')
    autocmd BufNewFile *.mk         call s:nf_shell(0, '')

    autocmd BufNewFile *.py         call s:nf_python(0)

    autocmd BufNewFile *.js         call s:nf_js(0)
    autocmd BufNewFile *.html       call s:nf_html(0)
    autocmd BufNewFile *.css        call s:nf_css(0)

    autocmd BufNewFile *.vim        call s:nf_vim(0)
    autocmd BufNewFile *.sql        call s:nf_sql(0)

    autocmd BufNewFile .gitignore   call s:nf_git_ignore(0)
augroup end


function! s:append(line, text)
    if a:line < 0 || append(a:line, a:text) != 0
        return -1
    endif
    return a:line + 1
endfunction


function! s:cursor(row, ...)
    if a:0 == 0
        call cursor(a:row, 0)
    else
        call cursor(a:row, a:1)
    endif
endfunction

function! s:get_username()
    if exists('g:ld.user')
        return g:ld.user
    endif

    let l:cmd = 'git config user.name'
    let l:out = system(l:cmd)
    if v:shell_error == 0
        return trim(l:out)
    endif

    return g:ld.default.user
endfunction

function! s:get_copyright()
    let l:copyright = []
    if exists('g:ld.copyright')
        if type(g:ld.copyright) != g:LD.T_LIST
            return [g:ld.copyright]
        endif

        let l:copyright = g:ld.copyright
    endif

    if len(l:copyright) > 0
        return l:copyright
    endif

    if exists('g:ld.company')
        call add(l:copyright, 'Copyright (C) ' . g:ld.company)
    endif

    let l:user = s:get_username()
    call add(l:copyright, 'Copyright (C) ' . l:user)

    return l:copyright
endfunction

function! s:delete(line)
    delete
    return a:line - 1
endfunction


function! s:infos1(line, prefix)
    return s:infos3(a:line, a:prefix, a:prefix, a:prefix)
endfunction


function! s:infos2(line, prefix, suffix)
    let l:l         = a:line
    let l:prefix    = a:prefix . ' '
    let l:suffix    = ' ' . a:suffix

    for l:info in s:get_copyright()
        let l:l = s:append(l:l, l:prefix . l:info. l:suffix)
    endfor
    return l:l
endfunction


function! s:infos3(line, start, end, prefix)
    let l:l         = a:line
    let l:prefix    = a:prefix . ' '

    let l:l = s:append(l:l, a:start)
    for l:info in s:get_copyright()
        let l:l = s:append(l:l, l:prefix . l:info)
    endfor
    let l:l = s:append(l:l, a:end)
    return l:l
endfunction


function! s:nf_js(line)
    let l:l = a:line
    let l:l = s:append(l:l, '#! /usr/bin/env node')
    let l:l = s:infos3(l:l, '/*', ' */', ' *')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '"use strict";')

    return l:l
endfunction


function! s:nf_html(line)
    let l:l = a:line
    let l:l = s:append(l:l, '<!DOCTYPE HTML>')
    let l:l = s:infos2(l:l, '<!--', '-->')
    let l:l = s:append(l:l, '<html lang="zh-CN">')
    let l:l = s:append(l:l, '<head>')
    let l:l = s:append(l:l, '    <meta charset="UTF-8">')
    let l:l = s:append(l:l, '    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">')
    let l:l = s:append(l:l, '    <title>' . expand('%:t') . '</title>')
    let l:p = l:l
    let l:l = s:append(l:l, '</head>')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '<body>')
    let l:l = s:append(l:l, '</body>')
    let l:l = s:append(l:l, '</html>')

    let l:l = s:delete(l:l)
    call s:cursor(l:p)
    return l:l
endfunction


function! s:nf_css(line)
    let l:l = a:line
    let l:l = s:infos3(l:l, '/*', ' */', ' *')
    let l:l = s:append(l:l, '')

    return l:l
endfunction


function! s:nf_c_family(line)
    let l:l = a:line
    let l:p = 0

    let l:l = s:infos3(l:l, '/*', ' */', ' *')
    let l:l = s:append(l:l, '')

    let l:ext = expand('%:e')
    if l:ext == 'h'
        let l:l = s:append(l:l, '#pragma once')
        let l:l = s:append(l:l, '')
    endif

    let l:l = s:append(l:l, '')

    if l:ext == 'h' || l:ext == 'hpp' || l:ext == 'cpp' || l:ext == 'c'
        if l:ext == 'cpp' || l:ext == 'c'
            let l:l = s:append(l:l, '#include "' . expand('%:t:r') .'.h"')
        else
            let l:l = s:append(l:l, '#include <string>')
        endif
        let l:l = s:append(l:l, '')
        let l:l = s:append(l:l, '')

        let l:l = s:append(l:l, 'namespace {')
        let l:l = s:append(l:l, '')
        let l:p = l:l
        let l:l = s:append(l:l, '')
        let l:l = s:append(l:l, '} /* end namespace */')
        let l:l = s:delete(l:l)
    endif

    if l:p != 0
        call s:cursor(l:p)
    endif
    return l:l
endfunction


function! s:nf_shell(line, shell)
    let l:l = a:line

    if a:shell != ''
        let l:l = s:append(l:l, '#! /usr/bin/env ' . a:shell)
    endif
    let l:l = s:infos1(l:l, '#')
    let l:l = s:append(l:l, '')

    if a:shell == 'bash'
        let l:l = s:append(l:l, '')
        let l:l = s:append(l:l, 'SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)"')
        let l:l = s:append(l:l, '')
    endif

    return l:l
endfunction


function! s:nf_python(line)
    let l:l = a:line

    let l:l = s:append(l:l, '#! /usr/bin/env python3')
    let l:l = s:append(l:l, '# -*- coding: utf-8 -*-')
    let l:l = s:infos1(l:l, '#')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'import traceback')
    let l:l = s:append(l:l, 'import sys')
    let l:l = s:append(l:l, 'import optparse')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'from typing import Tuple')
    let l:l = s:append(l:l, 'from typing import List')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'def get_options() -> Tuple[optparse.Values, List[str]]:')
    let l:l = s:append(l:l, '    parser = optparse.OptionParser(version = "%prog ('. s:get_username() .') 0.1")')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '    opts, args = parser.parse_args()')
    let l:l = s:append(l:l, '    return opts, args')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'def main(opts: optparse.Values, args: List[str]):')
    let l:p = l:l
    let l:l = s:append(l:l, '    return 0')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'if __name__ == "__main__":')
    let l:l = s:append(l:l, '    try:')
    let l:l = s:append(l:l, '        sys.exit(main(*get_options()))')
    let l:l = s:append(l:l, '    except KeyboardInterrupt:')
    let l:l = s:append(l:l, '        sys.stderr.write("\033[1;31moperation cancelled by user\033[0m\n")')
    let l:l = s:append(l:l, '        sys.exit(-1)')
    let l:l = s:append(l:l, '    except Exception:')
    let l:l = s:append(l:l, '        sys.stderr.write(traceback.format_exc())')
    let l:l = s:append(l:l, '        sys.exit(-1)')

    let l:l = s:delete(l:l)
    call s:cursor(l:p)
    return l:l
endfunction


function! s:nf_vim(line)
    let l:l = a:line

    let l:l = s:infos1(l:l, '"')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, "let s:current_directory = fnamemodify(resolve(expand('<sfile>:p')), ':h')")
    let l:l = s:append(l:l, '')

    return l:l
endfunction


function! s:nf_php(line)
    let l:l = a:line

    let l:l = s:append(l:l, '<?php')
    let l:l = s:infos1(l:l, '#')
    let l:l = s:append(l:l, '')
    let l:p = l:l
    let l:l = s:append(l:l, '?>')

    let l:l = s:delete(l:l)
    call s:cursor(l:p)
    return l:l
endfunction


function! s:nf_sql(line)
    let l:l = a:line

    let l:l = s:infos1(l:l, '--')

    return l:l
endfunction


function! s:nf_git_ignore(line)
    let l:l = a:line

    let l:l = s:append(l:l, '# git ignore')
    " let l:l = s:infos1(l:l, '#')
    let l:l = s:append(l:l, '.*')
    let l:l = s:append(l:l, '!.gitignore')

    return l:l
endfunction


function! s:nf_golang(line)
    let l:l = a:line
    let l:testing = expand('%:t') =~ '.*_test.go'
    let l:mod = expand('%:p:h:t')

    let l:l = s:infos3(l:l, '/*', ' */', ' *')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'package ' . l:mod)
    let l:p = l:l
    " let l:l = s:append(l:l, '')
    " let l:l = s:append(l:l, 'import ()')

    call s:cursor(l:p, 9)
    return l:l
endfunction

function! s:nf_protobuf(line)
    let l:l = a:line
    let l:mod = expand('%:p:h:t')

    let l:l = s:infos3(l:l, '/*', ' */', ' *')
    let l:l = s:append(l:l, '')
    let l:l = s:append(l:l, 'syntax = "proto2";')
    let l:l = s:append(l:l, 'package ' . l:mod . ';')
endfunction
