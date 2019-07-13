"
" Copyright (C) distroy
"


" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = fnamemodify('~/.cache/tags', ':p:h')
let g:gutentags_cache_dir = s:vim_tags

let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['--fields=+lniazS']
let g:gutentags_ctags_extra_args += ['--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxz']
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxz']

" 如果使用 universal ctags 需要增加下面一行
if executable('ctags') && system('ctags --version') =~? 'universal'
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
