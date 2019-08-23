"
" Copyright (C) distroy
"


if !exists('g:lightline')
    let g:lightline = {}
endif

function s:set_lightline(...)
    let l:l = len(a:000)
    if l:l < 2
        return
    endif

    let l:obj = g:lightline
    let l:i = 0
    while l:i < l:l - 2
        let l:key = a:000[l:i]
        let l:i = l:i + 1
        if !has_key(l:obj, l:key)
            let l:obj[l:key] = {}
        endif
        let l:obj = l:obj[l:key]
    endwhile
    let l:key = a:000[l:l - 2]
    let l:val = a:000[l:l - 1]
    if !has_key(l:obj, l:key)
        let l:obj[l:key] = l:val
    endif
endfunction



call s:set_lightline('colorscheme', 'wombat')

if has('mac')
    call s:set_lightline('separator', 'left', "\u25ba") " ►
    call s:set_lightline('separator', 'right', "\u25c4") " ◄
    call s:set_lightline('subseparator', 'left', "\u00bb") " »
    call s:set_lightline('subseparator', 'right', "\u00ab") " «
else
    call s:set_lightline('separator', 'left', "\ue0b0")
    call s:set_lightline('separator', 'right', "\ue0b2")
    call s:set_lightline('subseparator', 'left', "\ue0b1")
    call s:set_lightline('subseparator', 'right', "\ue0b3")
endif

" call s:set_lightline('component', 'filename', '%f')
let s:sl_right = [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
call s:set_lightline('active', 'left', [ ['mode', 'paste'], ['readonly', 'relativepath', 'modified', 'ld_current_function'] ])
call s:set_lightline('active', 'right', s:sl_right)
call s:set_lightline('inactive', 'left', [ ['relativepath'] ])
call s:set_lightline('inactive', 'right', s:sl_right)

call s:set_lightline('component_function', 'ld_current_function', 'ld.current_function')
