"
" Copyright (C) distroy
"


if !g:ld.plug.has('lightline.vim') | finish | endif


if !exists('g:lightline')
    let g:lightline = {}
endif

call g:ld.setnx('lightline', 'separator', 'left', "\u25ba") " ►
call g:ld.setnx('lightline', 'separator', 'right', "\u25c4") " ◄
call g:ld.setnx('lightline', 'subseparator', 'left', "\u00bb") " »
call g:ld.setnx('lightline', 'subseparator', 'right', "\u00ab") " «

" call g:ld.setnx('component', 'filename', '%f')
let s:sl_right = [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'] ]
call g:ld.setnx('lightline', 'active', 'left', [ ['mode', 'paste'], ['readonly', 'relativepath', 'modified', 'ld_current_function'] ])
call g:ld.setnx('lightline', 'active', 'right', s:sl_right)
call g:ld.setnx('lightline', 'inactive', 'left', [ ['relativepath'] ])
call g:ld.setnx('lightline', 'inactive', 'right', s:sl_right)

call g:ld.setnx('lightline', 'component_function', 'ld_current_function', 'g:ld.current_function')


" call g:ld.setnx('lightline', 'colorscheme', "default")

function s:color(name)
    let l:c = g:LD.COLOR[a:name]
    return [l:c[1], l:c[0]]
endfunction

let s:name = 'default'
let s:theme = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" normal

let s:theme.normal.left = [ [ s:color('DARKEST_BLUE'), s:color('MEDIUM_CYAN') ], [ s:color('WHITE'), s:color('GRAY4')] ]
let s:theme.normal.middle = [ [ s:color('GRAY7'), s:color('GRAY2') ] ]
let s:theme.normal.right = [ [ s:color('GRAY2'), s:color('TEAL') ], [ s:color('WHITE'), s:color('GRAY7') ], [ s:color('GRAY10'), s:color('GRAY5') ] ]
let s:theme.normal.error = [ [ s:color('GRAY9'), s:color('BRIGHTEST_RED') ] ]
let s:theme.normal.warning = [ [ s:color('GRAY1'), s:color('YELLOW') ] ]

" insert
" let s:theme.insert.left = [ [ s:color('DARKEST_CYAN'), s:color('WHITE') ], [ s:color('WHITE'), s:color('DARK_BLUE')] ]
" let s:theme.insert.middle = [ [ s:color('MEDIUM_CYAN'), s:color('DARKEST_BLUE') ] ]
" let s:theme.insert.right = [ [ s:color('DARKEST_CYAN'), s:color('MEDIUM_CYAN') ], [ s:color('MEDIUM_CYAN'), s:color('DARK_BLUE') ], [ s:color('MEDIUM_CYAN'), s:color('DARKEST_BLUE') ] ]
let s:theme.insert.left = [ [ s:color('DARKEST_GREEN'), s:color('BRIGHT_GREEN') ], [ s:color('WHITE'), s:color('GRAY4') ] ]

" visual
let s:theme.visual.left = [ [ s:color('DARK_RED'), s:color('BRIGHT_ORANGE') ], [ s:color('WHITE'), s:color('GRAY4') ] ]

" replace
let s:theme.replace.left = [ [ s:color('WHITE'), s:color('BRIGHT_RED') ], [ s:color('WHITE'), s:color('GRAY4') ] ]

" inactive
let s:theme.inactive.left =  [ [ s:color('GRAY7'), s:color('GRAY2') ] ]
let s:theme.inactive.middle = copy(s:theme.inactive.left)
let s:theme.inactive.right = copy(s:theme.inactive.left)

" tabline
let s:theme.tabline.left =  [ [ s:color('GRAY10'), s:color('GRAY3') ] ]
let s:theme.tabline.tabsel = [ [ s:color('GRAY10'), s:color('GRAY1') ] ]
let s:theme.tabline.middle = [ [ s:color('GRAY10'), s:color('GRAY3') ] ]
let s:theme.tabline.right = [ [ s:color('GRAY10'), s:color('GRAY7') ] ]

let g:lightline#colorscheme#{s:name}#palette = lightline#colorscheme#flatten(s:theme)
silent call lightline#init()
silent call lightline#update()
silent call lightline#highlight(s:name)
