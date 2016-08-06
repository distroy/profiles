"
" Copyright (C) distroy
"


nnoremap <F3>p :call <SID>grep(1, '-rwI', <SID>curr_word(), '*')<CR><CR> :cw<CR>
nnoremap <F3>l :call <SID>grep(0, '-rwI', <SID>curr_word(), <SID>curr_file())<CR><CR> :cw<CR>
vnoremap <F3>p :<c-u>call <SID>grep(1, '-rI', <SID>get_selection(), '*')<CR><CR> :cw<CR>
vnoremap <F3>l :<c-u>call <SID>grep(0, '-rI', <SID>get_selection(), <SID>curr_file())<CR><CR> :cw<CR>
" nnoremap <F3>i :grep --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp"} -I<Space>
nnoremap <expr> <F3>i <SID>get_grep_cmd('-I') . ' '


function! s:curr_word()
    return  expand('<cword>')
endfunction


function! s:curr_file()
    return expand('%')
endfunction


function! s:get_grep_cmd(opts)
    let l:grep = 'grep --exclude-dir={.git,.hg,.svn,node_modules} --exclude={tags,".*.swp"}'
    return printf(':%s %s', l:grep, a:opts)
endfunctio


function! s:get_selection()
    " Why is this not a built-in Vim script function?!
    let [l:line1, l:col1] = getpos("'<")[1:2]
    let [l:line2, l:col2] = getpos("'>")[1:2]
    let l:lines = getline(l:line1, l:line2)
    let l:lines[-1] = l:lines[-1][: l:col2 - (&selection == 'inclusive' ? 1 : 2)]
    let l:lines[0] = l:lines[0][l:col1 - 1:]
    return join(l:lines, "\n")
endfunction


function! s:grep(tabnew, opts, search, files)
    if a:tabnew
        tabnew
    endif

    let l:txt = a:search
    let l:txt = substitute(l:txt, '#', '\\#', 'g')
    let l:txt = substitute(l:txt, '%', '\\%', 'g')
    let l:txt = substitute(l:txt, '\"', '\\"', 'g')
    let l:grep = 'grep --exclude-dir={.git,.hg,.svn,node_modules} --exclude={tags,".*.swp"}'
    let l:cmd = printf('%s %s "%s" %s', l:grep, a:opts, l:txt, a:files)
    execute l:cmd
endfunction