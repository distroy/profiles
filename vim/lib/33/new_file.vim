"
" Copyright (C) distroy
"


if !exists('g:ld_copyright')
    let g:ld_copyright = []
    if exists('g:ld_company')
        call add(g:ld_copyright, 'Copyright (C) ' . g:ld_company)
    endif

    call add(g:ld_copyright, 'Copyright (C) ' . g:ld_user)
endif


augroup ld_new_files
    autocmd BufNewFile *.[ch]pp     call s:ld_nf_c_family(0)
    autocmd BufNewFile *.[ch]       call s:ld_nf_c_family(0)
    autocmd BufNewFile *.go         call s:ld_nf_golang(0)

    autocmd BufNewFile *.java       call s:ld_nf_c_family(0)

    autocmd BufNewFile *.php        call s:ld_nf_php(0)

    autocmd BufNewFile *.sh         call s:ld_nf_shell(0, 'bash')
    autocmd BufNewFile *.bash       call s:ld_nf_shell(0, 'bash')
    autocmd BufNewFile *.zsh        call s:ld_nf_shell(0, 'zsh')

    autocmd BufNewFile [Mm]akefile  call s:ld_nf_shell(0, '')
    autocmd BufNewFile *.mk         call s:ld_nf_shell(0, '')

    autocmd BufNewFile *.py         call s:ld_nf_python(0)

    autocmd BufNewFile *.js         call s:ld_nf_js(0)
    autocmd BufNewFile *.html       call s:ld_nf_html(0)
    autocmd BufNewFile *.css        call s:ld_nf_css(0)

    autocmd BufNewFile *.vim        call s:ld_nf_vim(0)
    autocmd BufNewFile *.sql        call s:ld_nf_sql(0)

    autocmd BufNewFile .gitignore   call s:ld_nf_git_ignore(0)
augroup end


function! s:ld_append(line, text)
    if a:line < 0 || append(a:line, a:text) != 0
        return -1
    endif
    return a:line + 1
endfunction


function! s:ld_cursor(row, ...)
    if a:0 == 0
        call cursor(a:row, 0)
    else
        call cursor(a:row, a:1)
    endif
endfunction


function! s:ld_delete(line)
    delete
    return a:line - 1
endfunction


function! s:ld_infos1(line, prefix)
    return s:ld_infos3(a:line, a:prefix, a:prefix, a:prefix)
endfunction


function! s:ld_infos2(line, prefix, suffix)
    let l:l         = a:line
    let l:prefix    = a:prefix . ' '
    let l:suffix    = ' ' . a:suffix

    for l:info in g:ld_copyright
        let l:l = s:ld_append(l:l, l:prefix . l:info. l:suffix)
    endfor
    return l:l
endfunction


function! s:ld_infos3(line, start, end, prefix)
    let l:l         = a:line
    let l:prefix    = a:prefix . ' '

    let l:l = s:ld_append(l:l, a:start)
    for l:info in g:ld_copyright
        let l:l = s:ld_append(l:l, l:prefix . l:info)
    endfor
    let l:l = s:ld_append(l:l, a:end)
    return l:l
endfunction


function! s:ld_nf_js(line)
    let l:l = a:line
    let l:l = s:ld_infos3(l:l, '/*', ' */', ' *')
    let l:l = s:ld_append(l:l, '')

    return l:l
endfunction


function! s:ld_nf_html(line)
    let l:l = a:line
    let l:l = s:ld_append(l:l, '<!DOCTYPE HTML>')
    let l:l = s:ld_infos2(l:l, '<!--', '-->')
    let l:l = s:ld_append(l:l, '<html lang="zh-CN">')
    let l:l = s:ld_append(l:l, '<head>')
    let l:l = s:ld_append(l:l, '    <meta charset="UTF-8">')
    let l:l = s:ld_append(l:l, '    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, minimum-scale=1, maximum-scale=1">')
    let l:l = s:ld_append(l:l, '    <title>' . expand('%:t') . '</title>')
    let l:p = l:l
    let l:l = s:ld_append(l:l, '</head>')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '<body>')
    let l:l = s:ld_append(l:l, '</body>')
    let l:l = s:ld_append(l:l, '</html>')

    let l:l = s:ld_delete(l:l)
    call s:ld_cursor(l:p)
    return l:l
endfunction


function! s:ld_nf_css(line)
    let l:l = a:line
    let l:l = s:ld_infos3(l:l, '/*', ' */', ' *')
    let l:l = s:ld_append(l:l, '')

    return l:l
endfunction


function! s:ld_nf_c_family(line)
    let l:l = a:line
    let l:p = 0

    let l:l = s:ld_infos3(l:l, '/*', ' */', ' *')
    let l:l = s:ld_append(l:l, '')

    let l:ext = expand('%:e')
    if l:ext == 'h'
        let l:l = s:ld_append(l:l, '#pragma once')
        let l:l = s:ld_append(l:l, '')
    endif

    let l:l = s:ld_append(l:l, '')

    if l:ext == 'h' || l:ext == 'hpp' || l:ext == 'cpp' || l:ext == 'c'
        if l:ext == 'cpp' || l:ext == 'c'
            let l:l = s:ld_append(l:l, '#include "' . expand('%:t:r') .'.h"')
        else
            let l:l = s:ld_append(l:l, '#include <string>')
        endif
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '')

        let l:l = s:ld_append(l:l, 'namespace {')
        let l:l = s:ld_append(l:l, '')
        let l:p = l:l
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, '} /* end namespace */')
        let l:l = s:ld_delete(l:l)
    endif

    if l:p != 0
        call s:ld_cursor(l:p)
    endif
    return l:l
endfunction


function! s:ld_nf_shell(line, shell)
    let l:l = a:line

    if a:shell != ''
        let l:l = s:ld_append(l:l, '#! /usr/bin/env ' . a:shell)
    endif
    let l:l = s:ld_infos1(l:l, '#')
    let l:l = s:ld_append(l:l, '')

    if a:shell == 'bash'
        let l:l = s:ld_append(l:l, '')
        let l:l = s:ld_append(l:l, 'SOURCE_DIR="$(dirname "$(readlink -f ${BASH_SOURCE[0]})")"')
        let l:l = s:ld_append(l:l, '')
    endif

    return l:l
endfunction


function! s:ld_nf_python(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '#! /usr/bin/env python')
    let l:l = s:ld_append(l:l, '# -*- coding: utf-8 -*-')
    let l:l = s:ld_infos1(l:l, '#')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'import traceback')
    let l:l = s:ld_append(l:l, 'import sys')
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
    let l:p = l:l
    let l:l = s:ld_append(l:l, '    return 0')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'if __name__ == "__main__":')
    let l:l = s:ld_append(l:l, '    try:')
    let l:l = s:ld_append(l:l, '        (opts, args) = get_options()')
    let l:l = s:ld_append(l:l, '        exit(main(opts, args))')
    let l:l = s:ld_append(l:l, '    except KeyboardInterrupt as exc:')
    let l:l = s:ld_append(l:l, '        sys.stderr.write("\033[1;31moperation cancelled by user\033[0m\n")')
    let l:l = s:ld_append(l:l, '        exit(-1)')
    let l:l = s:ld_append(l:l, '    except Exception as exc:')
    let l:l = s:ld_append(l:l, '        sys.stderr.write(traceback.format_exc())')
    let l:l = s:ld_append(l:l, '        exit(-1)')

    let l:l = s:ld_delete(l:l)
    call s:ld_cursor(l:p)
    return l:l
endfunction


function! s:ld_nf_vim(line)
    let l:l = a:line

    let l:l = s:ld_infos1(l:l, '"')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, "let s:current_directory = fnamemodify(resolve(expand('<sfile>:p')), ':h')")
    let l:l = s:ld_append(l:l, '')

    return l:l
endfunction


function! s:ld_nf_php(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '<?php')
    let l:l = s:ld_infos1(l:l, '#')
    let l:l = s:ld_append(l:l, '')
    let l:p = l:l
    let l:l = s:ld_append(l:l, '?>')

    let l:l = s:ld_delete(l:l)
    call s:ld_cursor(l:p)
    return l:l
endfunction


function! s:ld_nf_sql(line)
    let l:l = a:line

    let l:l = s:ld_infos1(l:l, '--')

    return l:l
endfunction


function! s:ld_nf_git_ignore(line)
    let l:l = a:line

    let l:l = s:ld_append(l:l, '# git ignore')
    " let l:l = s:ld_infos1(l:l, '#')
    let l:l = s:ld_append(l:l, '.*')
    let l:l = s:ld_append(l:l, '!.gitignore')

    return l:l
endfunction


function! s:ld_nf_golang(line)
    let l:l = a:line
    let l:testing = expand('%:t') =~ '.*_test.go'
    let l:mod = expand('%:p:h:t')

    let l:l = s:ld_infos3(l:l, '/*', ' */', ' *')
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'package ' . l:mod)
    let l:p = l:l
    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, 'import (')
    let l:l = s:ld_append(l:l, '    "bytes"')
    let l:l = s:ld_append(l:l, '    "context"')
    let l:l = s:ld_append(l:l, '    "errors"')
    let l:l = s:ld_append(l:l, '    "fmt"')
    let l:l = s:ld_append(l:l, '    "log"')
    let l:l = s:ld_append(l:l, '    "os"')
    let l:l = s:ld_append(l:l, '    "strconv"')
    let l:l = s:ld_append(l:l, '    "strings"')
    let l:l = s:ld_append(l:l, '    "sync"')
    let l:l = s:ld_append(l:l, '    "time"')
    if l:testing
        let l:l = s:ld_append(l:l, '    "testing"')
    endif
    let l:l = s:ld_append(l:l, ')')

    let l:l = s:ld_append(l:l, '')
    let l:l = s:ld_append(l:l, "// Always reference these packages, just in case the auto-generated code below doesn't.")
    let l:l = s:ld_append(l:l, 'var _ = bytes.NewBuffer')
    let l:l = s:ld_append(l:l, 'var _ = context.Canceled')
    let l:l = s:ld_append(l:l, 'var _ = errors.New')
    let l:l = s:ld_append(l:l, 'var _ = fmt.Sprintf')
    let l:l = s:ld_append(l:l, 'var _ = log.New')
    let l:l = s:ld_append(l:l, 'var _ = math.Abs')
    let l:l = s:ld_append(l:l, 'var _ = os.Exit')
    let l:l = s:ld_append(l:l, 'var _ = strconv.Itoa')
    let l:l = s:ld_append(l:l, 'var _ = strings.Replace')
    let l:l = s:ld_append(l:l, 'var _ = sync.NewCond')
    let l:l = s:ld_append(l:l, 'var _ = time.Now')
    if l:testing
        let l:l = s:ld_append(l:l, 'var _ = testing.Main')
    endif

    call s:ld_cursor(l:p, 9)
    return l:l
endfunction