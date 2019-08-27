"
" Copyright (C) distroy
"


call g:ld.namespace('ld', 'goto')

function! s:goto_definition(...)
    call <SID>goto('definition', a:000)
endfunction

function! s:goto_implementation(...)
    call <SID>goto('implementation', a:000)
endfunction

function! s:goto_references(...)
    call <SID>goto('references', a:000)
endfunction

function! s:goto(name, args)
    if has_key(b:ld.goto, a:name)
        call call(b:ld.goto[a:name], a:args)
        return
    endif
    if has_key(g:ld.goto, a:name)
        call call(g:ld.goto[a:name], a:args)
        return
    endif
endfunction


nmap <silent> <c-]> :<c-u>call <SID>goto_definition('tab')<CR>
nmap <silent> <c-w>] :<c-u>call <SID>goto_definition('tab')<CR>
nmap <silent> gd :<c-u>call <SID>goto_definition()<CR>
nmap <silent> <c-w>gd :<c-u>call <SID>goto_definition('tab')<CR>

nmap <silent> gi :<c-u>call <SID>goto_implementation()<CR>
nmap <silent> <c-w>gi :<c-u>call <SID>goto_implementation('tab')<CR>

nmap <silent> gr :<c-u>call <SID>goto_references()<CR>
nmap <silent> <c-w>gr :<c-u>call <SID>goto_references('tab')<CR>
