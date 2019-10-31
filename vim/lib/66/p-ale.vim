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

" ccls
let g:ale_c_ccls_init_options       = g:ld.ccls.init_options
let g:ale_cpp_ccls_init_options     = g:ld.ccls.init_options
let g:ale_objc_ccls_init_options    = g:ld.ccls.init_options

let g:ale_set_signs = 1

highlight clear ALEErrorSignLineNr
highlight clear ALEWarningSignLineNr
highlight clear ALEInfoSignLineNr

highlight clear ALEStyleErrorSign
highlight clear ALEStyleWarningSign
highlight clear ALEStyleInfoSign

highlight ALEWarning ctermbg=Blue ctermfg=White
highlight ALEError ctermbg=Red ctermfg=White
highlight clear ALEInfo
