
"set autoindent
set expandtab

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4

set backspace=indent,eol,start

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb2312,big5,euc-jp,euc-kr,latin1

syntax on
set hlsearch
set incsearch
set ignorecase
set smartcase

set ruler
set showcmd
"set cursorline
set scrolloff=3

set list
set listchars=tab:>-,trail:-
set nowrap


" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <C-F12> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags
set tags+=/usr/include/tags


" taglist
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_WinHeight = 40
let Tlist_WinWidth = 40
"let Tlist_Show_Menu = 1
"let Tlist_Use_Right_Window = 1


"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.[ch]pp,*.[ch],*.sh,*.java exec ":call _ld_set_title()"
""定义函数SetTitle，自动插入文件头
func _ld_set_title()
    if &filetype == 'sh'
        call append(0, '#!/bin/bash')
        call append(1, '')
        call append(2, '#')
        call append(3, '# Copyright (C) distroy')
        call append(4, '#')
        call append(5, '')
    else
        call append(0, '/*')
        call append(1, ' * Copyright (C) distroy')
        call append(2, ' */')
        call append(3, '')

        if expand("%:e") == 'h'
            call append(4, '#ifndef __LOLY_H__')
            call append(5, '#define __LOLY_H__')
            call append(6, '')
            call append(7, '')
            call append(8, '#endif /* __LOLY_H__ */')
        endif
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc


