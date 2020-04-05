"
" Copyright (C) distroy
"


let g:LD.COLOR = {}

let g:LD.COLOR.BLACK           = [16, "#000000"]
let g:LD.COLOR.WHITE           = [231, "#ffffff"]
let g:LD.COLOR.NONE            = ["NONE", ""]

let g:LD.COLOR.BROWN           = ['Brown', "a52a2a"]
let g:LD.COLOR.LIGHT_GRAY      = ['LightGray', "#d3d3d3"]
let g:LD.COLOR.LIGHT_GREY      = ['LightGrey', "#d3d3d3"]
let g:LD.COLOR.GRAY            = ['Gray', "#bebebe"]
let g:LD.COLOR.GREY            = ['Grey', "#bebebe"]
let g:LD.COLOR.DARK_GRAY       = ['DarkGray', "#a9a9a9"]
let g:LD.COLOR.DARK_GREY       = ['DarkGrey', "#a9a9a9"]

let g:LD.COLOR.DARKEST_GREEN   = [22, '#005f00']
let g:LD.COLOR.DARK_GREEN      = [28, '#008700']
let g:LD.COLOR.BRIGHT_GREEN    = [148, '#afdf00']
let g:LD.COLOR.MEDIUM_GREEN    = [70, '#5faf00']

let g:LD.COLOR.DARKEST_CYAN    = [23, '#005f5f']
let g:LD.COLOR.DARK_CYAN       = ['DarkCyan', "#008b8b"]
let g:LD.COLOR.MEDIUM_CYAN     = [117, '#87dfff']

let g:LD.COLOR.DARKEST_BLUE    = [24, "#005f87"]
let g:LD.COLOR.DARK_BLUE       = [31, "#0087af"]

let g:LD.COLOR.DARKEST_RED     = [52, "#5f0000"]
let g:LD.COLOR.DARK_RED        = [88, "#870000"]
let g:LD.COLOR.MEDIUM_RED      = [124, "#af0000"]
let g:LD.COLOR.BRIGHT_RED      = [160, "#df0000"]
let g:LD.COLOR.BRIGHTEST_RED   = [196, "#ff0000"]

let g:LD.COLOR.DARKEST_PURPLE   = [55, '#5f00af']
let g:LD.COLOR.BRIGHT_PURPLE    = [189, '#dfdfff']
let g:LD.COLOR.MEDIUM_PURPLE    = [98, '#875fdf']

let g:LD.COLOR.BRIGHTEST_ORANGE = [214, '#ffaf00']
let g:LD.COLOR.BRIGHT_ORANGE    = [208, '#ff8700']

let g:LD.COLOR.RED             = [160, '#dc322f']
let g:LD.COLOR.BLUE            = [33, '#268bd2']
let g:LD.COLOR.CYAN            = [37, '#2aa198']
let g:LD.COLOR.GREEN           = [64, '#859900']
let g:LD.COLOR.ORANGE          = [166, '#cb4b16']
let g:LD.COLOR.MAGENTA         = [125, '#d33682']
let g:LD.COLOR.YELLOW          = [136, '#b58900']
let g:LD.COLOR.VIOLET          = [61, '#6c71c4']

let g:LD.COLOR.GRAY0           = [233, '#121212']
let g:LD.COLOR.GRAY1           = [235, '#262626']
let g:LD.COLOR.GRAY2           = [236, '#303030']
let g:LD.COLOR.GRAY3           = [239, '#4e4e4e']
let g:LD.COLOR.GRAY4           = [240, '#585858']
let g:LD.COLOR.GRAY5           = [241, '#606060']
let g:LD.COLOR.GRAY6           = [244, '#808080']
let g:LD.COLOR.GRAY7           = [245, '#8a8a8a']
let g:LD.COLOR.GRAY8           = [247, '#9e9e9e']
let g:LD.COLOR.GRAY9           = [250, '#bcbcbc']
let g:LD.COLOR.GRAY10          = [252, '#d0d0d0']

let g:LD.COLOR.GREY0           = [234, '#1b1b1b']

let g:LD.COLOR.PINK            = [212, "#ff87d7"]
let g:LD.COLOR.LIGHT_PINK      = [218, "#ffafd7"]
let g:LD.COLOR.HOT_PINK        = [201, "#ff00ff"]
let g:LD.COLOR.TEAL            = [123, "#87ffff"]
let g:LD.COLOR.LIGHT_BLUE      = [159, "#afffff"]
let g:LD.COLOR.LIGHT_YELLOW    = [229, "#ffffaf"]
let g:LD.COLOR.MINT            = [158, "#afffd7"]
let g:LD.COLOR.DARK_MINT       = [49, "#00ffaf"]
let g:LD.COLOR.LAVENDER        = [183, "#d7afff"]
let g:LD.COLOR.GRAY_PURPLE     = [146, "#afafd7"]
let g:LD.COLOR.DARK_LAVENDER   = [97, "#875faf"]


function! g:ld.highlight(name, fg, bg, style)
    let l:l = ['highlight', a:name]

    if type(a:fg) == g:LD.T_LIST
        let l:l = add(l:l, 'ctermfg=' . a:fg[0])
    else
        let l:l = add(l:l, 'ctermfg=' . a:fg)
    endif
    if type(a:bg) == g:LD.T_LIST
        let l:l = add(l:l, 'ctermbg=' . a:bg[0])
    else
        let l:l = add(l:l, 'ctermbg=' . a:bg)
    endif

    if type(a:fg) == g:LD.T_LIST && a:fg[1] != ''
        let l:l = add(l:l, 'guifg=' . a:fg[1])
    endif
    if type(a:bg) == g:LD.T_LIST && a:bg[1] != ''
        let l:l = add(l:l, 'guibg=' . a:bg[1])
    endif

    if a:style != ''
        let l:l = add(l:l, 'cterm=' . a:style)
        let l:l = add(l:l, 'gui=' . a:style)
    endif
    let l:cmd = join(l:l, ' ')
    execute l:cmd
endfunction
