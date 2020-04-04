"
" Copyright (C) distroy
"


set ruler
set showcmd

set laststatus=2

" wildmenu
set wildmenu
set wildmode=full
set wildignorecase

let s:wildignore = '*/tmp/*'
let s:wildignore .= ',*/target/*'
let s:wildignore .= ',*.so,*.swp,*.zip,*.class,tags'
let s:wildignore .= ',*.jpg,*.ttf,*.TTF,*.png,*.svg'
let s:wildignore .= ',.git,.svn,.hg'
let s:wildignore .= ',.DS_Store'
execute 'set wildignore+=' . s:wildignore
