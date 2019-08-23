"
" Copyright (C) distroy
"


if !g:ld.plug.has('ale') | finish | endif

let g:ale_lint_on_text_changed = 'always'

let g:ale_sign_column_always = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warn'
let g:ale_echo_msg_format = '[%linter%] [%severity%]% (code)%: %s'

" let g:ale_open_list = 1
" let g:ale_keep_list_window_open = 1

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


let g:ale_set_signs = 1

highlight clear ALEErrorSignLineNr
highlight clear ALEWarningSignLineNr
highlight clear ALEInfoSignLineNr

highlight clear ALEStyleErrorSign
highlight clear ALEStyleWarningSign
highlight clear ALEStyleInfoSign

" highlight ALEStyleError ctermbg=Red
" highlight ALEStyleWarning ctermbg=Yellow
" highlight ALEStyleInfo ctermbg=None

autocmd FileType python call <SID>ld_clear_ale_highlight()

function s:ld_clear_ale_highlight()
    highlight clear ALEError
    highlight clear ALEWarning
    highlight clear ALEInfo
endfunction
