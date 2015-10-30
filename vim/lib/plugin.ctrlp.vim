"
" Copyright (C) distroy
"


let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(swp|o|so|dll|exe|pyc|class)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
