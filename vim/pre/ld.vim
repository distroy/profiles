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
    let [l:line1, l:col1] = getpos("'<")[1:2]
    let [l:line2, l:col2] = getpos("'>")[1:2]
    let l:lines = getline(l:line1, l:line2)
    let l:lines[-1] = l:lines[-1][: l:col2 - (&selection == 'inclusive' ? 1 : 2)]
    let l:lines[0] = l:lines[0][l:col1 - 1:]
    return join(l:lines, "\n")
endfunction


function! ld#grep(tabnew, option, search, files)
    if a:tabnew
        tabnew
    endif

    let l:txt = a:search
    let l:txt = substitute(l:txt, '#', '\\#', 'g')
    let l:txt = substitute(l:txt, '\"', '\\"', 'g')
    let l:grep = 'grep --exclude-dir={.git,.hg,.svn} --exclude={tags,".*.swp"}'
    let l:cmd = printf(':%s %s "%s" %s', l:grep, a:option, l:txt, a:files)
    execute l:cmd
endfunction


function! ld#hook_pre_save()
    let l:pos = getcurpos()
    %s/\s\+$//e
    call setpos('.', l:pos)
endfunction
