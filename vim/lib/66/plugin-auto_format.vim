"
" Copyright (C) distroy
"


if !g:ld.plug.has('vim-autoformat') | finish | endif


let s:current_directory = fnamemodify(resolve(expand('<sfile>:p')), ':h')

nnoremap <F11> :Autoformat<CR>

" let g:autoformat_verbosemode = 1


" javascript
" npm -g install js-beautify
let g:formatdef_jsbeautify_javascript = '"js-beautify -X -j -f - -".(&expandtab ? "s ".shiftwidth() : "t").(&textwidth ? " -w ".&textwidth : "")'

" python
" pip install autopep8
let g:formatdef_autopep8 = '"autopep8 -" . (g:DoesRangeEqualBuffer(a:firstline, a:lastline) ? " --range " . a:firstline . " " . a:lastline : "") . " --max-line-length=100"'

let g:ld_clang_format_conf = s:current_directory . '/auto_format/clang-format'
let g:formatdef_clangformat = "'clang-format -lines=' . a:firstline . ':' . a:lastline"
    \ . " . ' --assume-filename=\"' . expand('%:p') . '\" -style=\"file\"'"
