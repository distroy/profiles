"
" Copyright (C) distroy
"


function! s:help()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'vertical' 'help' expand('<cword>')
        return
    endif

    if exists('b:ld.help')
        call b:ld_help()
        return
    endif

    if exists('g:ld.help')
        call g:ld.help()
    endif
endfunction

nnoremap <silent> <F1> :<C-U>call <SID>help()<CR>
nnoremap <silent> K :<C-U>call <SID>help()<CR>
