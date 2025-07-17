"
" Copyright (C) distroy
"


autocmd! TabEnter * call s:after_enter()
autocmd! TabClosed * call s:after_closed()

let s:tab = g:ld.namespace('g:ld.tab')
let s:histories = g:ld.setnx(s:tab, 'histories', [])

function! s:after_enter()
    let l:n = tabpagenr()
    if l:n == 0
        return
    endif
    let l:i = 0
    while l:i < len(s:histories)
        let l:v = s:histories[l:i]
        if l:n == l:v
            call remove(s:histories, l:i)
            continue
        endif
        let l:i += 1
    endwhile
    call add(s:histories, l:n)
    let l:max_history = s:get_max_history()
    if len(s:histories) > l:max_history
        call remove(s:histories, 0, len(s:histories) - l:max_history - 1)
    endif
endfunction

function! s:after_closed()
    let l:n = tabpagenr()
    let l:i = 0
    while l:i < len(s:histories)
        let l:v = s:histories[l:i]
        if l:v == l:n
            call remove(s:histories, l:i)
            continue
        endif
        if l:v > l:n
            let s:histories[l:i] = l:v - 1
        endif
        let l:i += 1
    endwhile
    if len(s:histories) > 0
        execute 'tabnext ' . s:histories[-1]
    endif
endfunction

function! s:get_max_history()
    let l:max_history = g:ld.setnx(s:tab, 'max_history', 100)
    return l:max_history
endfunction
