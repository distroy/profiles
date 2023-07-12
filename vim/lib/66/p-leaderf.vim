"
" Copyright (C) distroy
"


if !g:ld.plug.has('LeaderF') | finish | endif


highlight Lf_hl_match guifg = blue ctermfg = blue
highlight Lf_hl_matchRefine  guifg = magenta ctermfg = magenta

nnoremap <silent> <F2> :Leaderf bufTag<CR>
nnoremap <silent> <c-p> :Leaderf file<CR>


let g:Lf_WindowPosition = 'popup'
" let g:Lf_PopupColorscheme = 'default'

" let g:Lf_PreviewCode = 1
let g:Lf_PreviewInPopup = 1
let g:Lf_PopupPreviewPosition = 'top'

let g:Lf_WorkingDirectoryMode = 'Ac'

let g:Lf_CommandMap = {
    \ '<Up>': ['<c-p>'],
    \ '<Down>': ['<c-n>'],
    \ '<C-]>': ['<c-v>'],
\ }

" let g:Lf_UseVersionControlTool = 0
let g:Lf_WildIgnore = {
    \ 'dir': [
        \ '.svn',
        \ '.git',
        \ '.hg',
        \ 'vendor',
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
