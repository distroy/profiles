"
" Copyright (C) distroy
"


if !g:ld.plug.has('coc.nvim') | finish | endif

" coc-python

call coc#add_extension('coc-marketplace')
call coc#add_extension('coc-pairs')
call coc#add_extension('coc-json')
call coc#add_extension('coc-tsserver')
call coc#add_extension('coc-vimlsp')
call coc#add_extension('coc-pyright')
call coc#add_extension('coc-go')
" call coc#add_extension('coc-ccls')
call coc#add_extension('coc-sql')
call coc#add_extension('coc-java')
call coc#add_extension('coc-protobuf')
call coc#add_extension('coc-git')
" call coc#add_extension('coc-tabnine')

" call coc#config('git.addGBlameToVirtualText', v:true)

call coc#config('coc.preferences.timeout', 500)
call coc#config('coc.preferences.rootPatterns', ['.root', '.svn', '.git', '.hg', '.project'])
call coc#config('coc.preferences.currentFunctionSymbolAutoUpdate', v:true)
call coc#config('coc.preferences.formatOnType', v:true)
" call coc#config('coc.preferences.formatOnSaveFiletypes', ['go'])

" call coc#config('coc.preferences.extensionUpdateCheck', v:true)
" call coc#config('coc.preferences.silentAutoupdate', v:true)
call coc#config('coc.preferences.currentFunctionSymbolAutoUpdate', v:true)
call coc#config('coc.preferences.messageLevel', "more")

call coc#config('suggest.autoTrigger', "always")
call coc#config('suggest.timeout', 500)             " 调整补全超时时间
call coc#config('suggest.enablePreview', v:false)   " 让vim 弹出预览窗口
call coc#config('suggest.enablePreselect', v:false) " 关闭neovim的预选功能
call coc#config('suggest.noselect', v:true)         " 补全开启时不选中第一项
call coc#config('suggest.minTriggerInputLength', 1) " 设置最少补全触发字符数
call coc#config('suggest.snippetIndicator', "*") " 改变代码片段的提示字符*
" call coc#config('suggest.snippetIndicator', "\u2b50\ufe0e") " 改变代码片段的提示字符⭐︎
" call coc#config('suggest.snippetIndicator', "\u2729")       " 改变代码片段的提示字符✩
call coc#config('suggest.triggerAfterInsertEnter', v:true)  " 进入插入模块即触发自动补全
" call coc#config('suggest.keepCompleteopt', v:true)

call coc#config('signature.enable', v:true)
call coc#config('signature.triggerSignatureWait', 500) " unit: ms

call coc#config('diagnostic.enable', v:true)
call coc#config('diagnostic.displayByAle', v:true)
call coc#config('diagnostic.level', "warning")
call coc#config('diagnostic.checkCurrentLine', v:true)
call coc#config('diagnostic.errorSign', ">>")
call coc#config('diagnostic.warningSign', ">>")

" call coc#config('diagnostic.floatConfig.border', v:true)
" call coc#config('hover.floatConfig.border', v:true)
" call coc#config('signature.floatConfig.border', v:true)
" call coc#config('suggest.floatConfig.border', v:true)
" call coc#config('suggest.floatConfig.rounded', v:true)

" highlight CocMenuSel ctermbg=238
" highlight CocListLine ctermbg=238
call g:ld.highlight('CocMenuSel', '', [238, g:LD.COLOR.NVIM.NvimDarkGrey4], '')
call g:ld.highlight('CocListLine', '', [238, g:LD.COLOR.NVIM.NvimDarkGrey4], '')
call g:ld.highlight('CocFloating', '', g:LD.COLOR.GRAY2, "NONE")

highlight CocErrorSign ctermfg=Black ctermbg=Red guifg=#ff0000
highlight CocWarningSign ctermfg=Black ctermbg=Yellow guifg=#ff922b
highlight default link CocErrorHighlight none
highlight default link CocWarningHighlight none

" go
call coc#config('go.checkForUpdates', "enable")
call coc#config('go.goplsOptions.completeUnimported', v:true)
call coc#config('go.goplsOptions.semanticTokens', v:true)

" cpp
call coc#config('languageserver.ccls.command', "ccls")
call coc#config('languageserver.ccls.filetypes', ["c", "cpp", "objc", "objcpp"])
call coc#config('languageserver.ccls.rootPatterns', [".ccls", "compile_commands.json", ".vim/", ".git/", ".hg/"])
call coc#config('languageserver.ccls.initializationOptions', g:ld.ccls.init_options)

" java
call coc#config('java.trace.server', "verbose")
call coc#config('java.import.maven.enabled', v:true)
call coc#config('java.maven.downloadSources', v:true)

" current function
function! g:ld.current_function()
    return get(b:, 'coc_current_function', '')
endfunction


let g:coc_status_error_sign = 'Error'
let g:coc_status_warning_sign = 'Warn'


" " if hidden is not set, TextEdit might fail.
" set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" " Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
    \   coc#pum#visible() ? coc#pum#next(1) :
    \   <SID>check_back_space() ? "\<TAB>" :
    \   coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <Down>
    \   coc#pum#visible() ? coc#pum#next(1) :
    \   <SID>check_back_space() ? "\<TAB>" :
    \   coc#refresh()
inoremap <expr><Up> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"



function! s:check_back_space() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
"     \   "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" mapping keys goto
function! s:goto(action, args)
    if len(a:args) == 0 || a:args[0] != 'tab'
        call CocActionAsync(a:action)
    else
        call CocActionAsync(a:action, 'tab drop')
    endif
endfunction

" nmap <silent> gd <Plug>(coc-definition)
function! g:ld.goto.definition(...)
    call <SID>goto('jumpDefinition', a:000)
endfunction
" nmap <silent> gi <Plug>(coc-implementation)
function! g:ld.goto.implementation(...)
    call <SID>goto('jumpImplementation', a:000)
endfunction
" nmap <silent> gr <Plug>(coc-references)
function! g:ld.goto.references(...)
    call <SID>goto('jumpReferences', a:000)
endfunction
" " nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gy :<c-u>call CocActionAsync('jumpTypeDefinition')<CR>
" nmap <silent> <c-w>gy :<c-u>call CocActionAsync('jumpTypeDefinition', "tab drop")<CR>

function! g:ld.goto.rename(...)
    call <SID>goto('rename', a:000)
endfunction

function! g:ld.help()
    call CocActionAsync('doHover')
endfunction

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 CocRename :call CocActionAsync('rename')

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup ld_coc_group
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder if exists('*CocActionAsync') | call CocActionAsync('showSignatureHelp') | endif
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent if exists('*CocActionAsync') | call CocActionAsync('highlight') | endif
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <c-s> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <c-s> <Plug>(coc-range-select)
xmap <silent> <c-s> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 CocFormat :call CocActionAsync('format')

" Use `:Fold` to fold current buffer
command! -nargs=? CocFold :call CocActionAsync('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 CocOR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
