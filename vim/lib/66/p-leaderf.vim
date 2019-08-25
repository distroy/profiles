"
" Copyright (C) distroy
"


if !g:ld.plug.has('LeaderF') | finish | endif


highlight Lf_hl_match guifg = blue ctermfg = blue
highlight Lf_hl_matchRefine  guifg = magenta ctermfg = magenta

nnoremap <silent> <F2> :Leaderf bufTag<CR>
nnoremap <silent> <c-p> :Leaderf file<CR>


let g:Lf_WorkingDirectoryMode = 'A'
let g:Lf_CommandMap = {
    \ '<Up>': ['<c-p>'],
    \ '<Down>': ['<c-n>'],
    \ '<C-]>': ['<c-v>'],
\ }

let g:Lf_WildIgnore = {
    \ 'dir': [
        \ '.svn',
        \ '.git',
        \ '.hg',
        \ 'node_modules',
    \ ],
    \ 'file': [
        \ '*.sw?',
        \ '*.o',
        \ '*.so',
        \ '*.dll',
        \ '*.exe',
        \ '*.py[co]',
        \ '*.class',
    \ ],
\ }
