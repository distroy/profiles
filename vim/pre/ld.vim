"
" Copyright (C) distroy
"


function! ld#set_tab(w)
    let l:w = a:w
    let &l:tabstop      = l:w
    let &l:shiftwidth   = l:w
    let &l:softtabstop  = l:w
endfunction


function! ld#set_tags(path)
    if &l:tags != ''
        let &l:tags .= ','
    endif

    let &l:tags .= a:path
endfunction


function! ld#curr_word()
    return  expand('<cword>')
endfunction


function! ld#curr_file()
    return expand('%')
endfunction


function! ld#get_selection()
    " Why is this not a built-in Vim script function?!
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction


function! ld#grep(option, search, files)
    let l:txt = a:search
    let l:txt = substitute(l:txt, '#', '\\#', 'g')
    let l:txt = substitute(l:txt, '\"', '\\"', 'g')
    let l:grep = 'grep --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp"}'
    let l:cmd = printf(':%s %s "%s" %s', l:grep, a:option, l:txt, a:files)
    echohl l:cmd
    exec l:cmd
endfunction

