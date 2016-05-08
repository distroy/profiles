"
" Copyright (C) distroy
"


let g:clang_format#code_style   = 'google'
" let g:clang_format#auto_format_on_insert_leave = 1
let g:clang_format#style_options = {
    \ 'AccessModifierOffset' : -4,
    \ 'AllowShortIfStatementsOnASingleLine' : 'true',
    \ 'AlwaysBreakTemplateDeclarations' : 'true',
    \ 'Standard' : 'C++11',
    \ 'BreakBeforeBraces' : 'Attach',
    \ 'TabWidth' : 4,
    \ }

nnoremap <F11> :ClangFormat<CR>
