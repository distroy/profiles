"
" Copyright (C) distroy
"


if !g:ld.plug.has('YouCompleteMe') | finish | endif


function! s:ld_get_ycm_conf()
    let l:files = findfile('.ycm_extra_conf.py', expand('%:p:h').';')
    if len(l:files) != 0
        return l:files
    endif

    return g:ld.vim_path . '/share/ycm_extra_conf.py'
endfunction


let g:ycm_global_ycm_extra_conf = s:ld_get_ycm_conf()

let g:ycm_confirm_extra_conf                    = 0 " 打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tags_files   = 1 " 使用ctags生成的tags文件

set completeopt=longest,menu    " 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif " 离开插入模式后自动关闭预览窗口

" " 回车即选中当前项
" inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" " 上下左右键的行为 会显示其他信息
" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
" inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion    = ['<c-n>']
" let g:ycm_key_list_select_completion    = ['<Down>']
" let g:ycm_key_list_previous_completion  = ['<c-p>']
" let g:ycm_key_list_previous_completion  = ['<Up>']

let g:ycm_cache_omnifunc                        = 0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax          = 1 " 语法关键字补全
let g:ycm_min_num_of_chars_for_completion       = 2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars    = 2
let g:ycm_semantic_triggers =  {
    \ 'c,cpp': ['.', '->', '::', 're!\w{2}'],
    \ 'javascript,python,go': ['.', 're!\w{2}'],
    \ }

" " force recomile with syntastic
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" " nnoremap <leader>lo :lopen<CR> " open locationlist
" " nnoremap <leader>lc :lclose<CR>    " close locationlist
" inoremap <leader><leader> <C-x><C-o>

" 在注释输入中也能补全
let g:ycm_complete_in_comments  = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings   = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_goto_buffer_command = 'new-or-existing-tab'

" 跳转到定义处
function! g:ld.goto.definition(...)
    if len(a:000) == 0 || a:000[0] != 'tab'
        YcmCompleter GoTo
    else
        tab YcmCompleter GoTo
    endif
endfunction

let g:ycm_show_diagnostics_ui = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" 标记颜色
" highlight YcmErrorSign
" highlight YcmWarningSign ctermbg = none
" 代码中出错字段颜色
highlight YcmErrorSection ctermbg = none
highlight YcmWarningSection ctermbg = none
" 出错行颜色
" highlight YcmErrorLine
" highlight YcmWarningLine
