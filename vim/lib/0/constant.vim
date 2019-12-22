"
" Copyright (C) distroy
"

if !exists('g:LD') || type(g:LD) != type({})
    let g:LD = {}
endif

if version >= 800
    let g:LD.T_NUMBER = v:t_number
    let g:LD.T_STRING = v:t_string
    let g:LD.T_FUNC = v:t_func
    let g:LD.T_LIST = v:t_list
    let g:LD.T_DICT = v:t_dict
    let g:LD.T_FLOAT = v:t_float
    let g:LD.T_BOOL = v:t_bool
    let g:LD.T_NULL = type(v:null)
    let g:LD.TRUE = v:true
    let g:LD.FALSE = v:false
else
    let g:LD.T_NUMBER = type(0)
    let g:LD.T_STRING = type('')
    let g:LD.T_FUNC = type(function("tr"))
    let g:LD.T_LIST = type([])
    let g:LD.T_DICT = type({})
    let g:LD.T_FLOAT = type(0.0)

    let g:LD.FALSE = 0
    let g:LD.TRUE = 1
    let g:LD.T_BOOL = type(g:LD.FALSE)
endif
