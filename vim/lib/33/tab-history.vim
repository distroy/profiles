"
" Copyright (C) distroy
"


augroup ld_tab_histroy
    autocmd!
    autocmd TabNew * call <SID>on_creating()
    autocmd TabEnter * call <SID>after_enter()
    autocmd TabClosed * call <SID>after_closed()
augroup end

" function! s:log(evt)
"     echomsg a:evt . ' ' . tabpagenr()
" endfunction

function! s:on_creating()
    " `on_creating` should be called before `after_enter`
    let l:n = tabpagenr()
    let l:histories = s:get_histories()
    for l:i in range(0, len(l:histories) - 1)
        if l:histories[l:i] >= l:n
            let l:histories[l:i] += 1
        endif
    endfor
endfunction

function! s:after_enter()
    let l:n = tabpagenr()
    if l:n == 0
        return
    endif
    let l:histories = s:get_histories()
    let l:i = 0
    while l:i < len(l:histories)
        if l:histories[l:i] == l:n
            call remove(l:histories, l:i)
            continue
        endif
        let l:i += 1
    endwhile
    call add(l:histories, l:n)
    let l:max_history = s:get_max_history()
    if len(l:histories) > l:max_history
        call remove(l:histories, 0, len(l:histories) - l:max_history - 1)
    endif
endfunction

function! s:after_closed()
    let l:n = tabpagenr()
    let l:histories = s:get_histories()
    let l:i = 0
    while l:i < len(l:histories)
        let l:v = l:histories[l:i]
        if l:v == l:n
            call remove(l:histories, l:i)
            continue
        endif
        if l:v > l:n
            let l:histories[l:i] = l:v - 1
        endif
        let l:i += 1
    endwhile
    if len(l:histories) > 0
        execute 'tabnext ' . l:histories[-1]
    endif
endfunction

function! s:get_histories()
    return g:ld.setnx(g:ld.namespace('g:ld.tab'), 'histories', [])
endfunction

function! s:get_max_history()
    return max([g:ld.setnx(g:ld.namespace('g:ld.tab'), 'max_history', 100), 10])
endfunction

call s:get_histories()
