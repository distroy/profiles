"
" Copyright (C) distroy
"


if g:ld_tagshow == 'leaderf'
    finish
endif

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:100'


let g:ctrlp_custom_ignore = {}
let g:ctrlp_custom_ignore['dir'] = '\v[\/](\.git|\.hg|\.svn|node_modules)$'
let g:ctrlp_custom_ignore['file'] = '\v\.(swp|o|so|dll|exe|pyc|class)$'
let g:ctrlp_custom_ignore['link'] = 'some_bad_symbolic_links'
