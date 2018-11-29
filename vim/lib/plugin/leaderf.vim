"
" Copyright (C) distroy
"

if g:ld_tagshow != 'leaderf'
    finish
endif

highlight Lf_hl_match guifg = blue ctermfg = blue
highlight Lf_hl_matchRefine  guifg = magenta ctermfg = magenta

nnoremap <silent> <F2> :Leaderf bufTag<CR>
nnoremap <silent> <c-p> :Leaderf file<CR>
