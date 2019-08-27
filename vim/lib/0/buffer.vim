"
" Copyright (C) distroy
"


function! s:init_buffer()
    if !exists('b:ld') || type(b:ld) != v:t_dict
        let b:ld = {}
        for l:v in values(g:ld._ns_cache)
            call g:ld._namespace(b:, l:v)
        endfor
    endif
endfunction

augroup ld.init_buffer
    autocmd!
    autocmd BufNew * call <SID>init_buffer()
    autocmd BufReadPre * call <SID>init_buffer()
    autocmd BufWinEnter * call <SID>init_buffer()
    autocmd BufNewFile * call <SID>init_buffer()
augroup end
