"
" Copyright (C) distroy
"


nnoremap <F11> :Autoformat<CR>

" let g:autoformat_verbosemode = 1


" javascript
" npm -g install js-beautify

" python
" pip install autopep8


let s:style_cpp = {}

" 基础样式
" BasedOnStyle: LLVM
let s:style_cpp['BasedOnStyle'] = 'google'

" AlignEscapedNewlinesLeft: true
let s:style_cpp['AlignEscapedNewlinesLeft'] = 'true'

" AlwaysBreakTemplateDeclarations: true
let s:style_cpp['AlwaysBreakTemplateDeclarations'] = 'true'

" 类的访问修饰关键字(private, public, protected···)缩进
" private:
" int a;
" 1表示不缩进
" 大于1的值表示访问修饰关键字的左侧从int a的左侧列开始往右侧移动的距离
" AccessModifierOffset: 1
let s:style_cpp['AccessModifierOffset'] = -4

" 在未封闭(括号的开始和结束不在同一行)的括号中的代码是否对齐, 例如
" if (a &&
"     b)
" AlignAfterOpenBracket: true
let s:style_cpp['AlignAfterOpenBracket'] = 'false'
" let s:style1['javascript']['AlignAfterOpenBracket'] = 'AlwaysBreak'

" 多行赋值语句按=号对齐
" AlignConsecutiveAssignments: false
let s:style_cpp['AlignConsecutiveAssignments'] = 'true'

" 多行声明语句按=号对齐
" AlignConsecutiveDeclarations: false
" let s:style_cpp['AlignConsecutiveDeclarations'] = 'true'

" 行尾注释对齐
" AlignTrailingComments: true
let s:style_cpp['AlignTrailingComments'] = 'true'

" 不支持一行的函数
" AllowShortFunctionsOnASingleLine: None
let s:style_cpp['AllowShortFunctionsOnASingleLine'] = 'true'
" let s:style1['javascript']['AllowShortFunctionsOnASingleLine'] = 'false'

" 不支持一行的循环体
" AllowShortLoopsOnASingleLine: false
let s:style_cpp['AllowShortLoopsOnASingleLine'] = 'false'

" 不支持一行的条件判断语句
" AllowShortIfStatementsOnASingleLine: false
let s:style_cpp['AllowShortIfStatementsOnASingleLine'] = 'false'

" AlwaysBreakBeforeMultilineStrings: true
let s:style_cpp['AlwaysBreakBeforeMultilineStrings'] = 'true'

" PenaltyBreakBeforeFirstCallParameter: 1
" PenaltyBreakComment: 300
" PenaltyBreakFirstLessLess: 120
" PenaltyBreakString: 1000
" PenaltyExcessCharacter: 1000000
" PenaltyReturnTypeOnItsOwnLine: 200
let s:style_cpp['PenaltyBreakBeforeFirstCallParameter'] = 100
let s:style_cpp['PenaltyBreakComment'] = 100
let s:style_cpp['PenaltyBreakFirstLessLess'] = 100
let s:style_cpp['PenaltyBreakString'] = 100
let s:style_cpp['PenaltyExcessCharacter'] = 100
let s:style_cpp['PenaltyReturnTypeOnItsOwnLine'] = 100

" 圆括号的换行方式
" BreakBeforeBraces: Attach, Linux
let s:style_cpp['BreakBeforeBraces'] = 'Attach'

" 在构造函数初始化时按逗号断行，并以冒号对齐
" BreakConstructorInitializersBeforeComma: true
let s:style_cpp['BreakConstructorInitializersBeforeComma'] = 'true'

" 每行字符的长度
" ColumnLimit: 120
let s:style_cpp['ColumnLimit'] = 100

" 最多能超出ColumnLimit多少个字符
" PenaltyExcessCharacter: 0
let s:style_cpp['PenaltyExcessCharacter'] = 20

" 格式兼容C++11
" Cpp11BracedListStyle: true
let s:style_cpp['Cpp11BracedListStyle'] = 'true'

" 禁用当前format文件
" DisableFormat: false

" switch的case缩进
" IndentCaseLabels: true
let s:style_cpp['IndentCaseLabels'] = 'false'

" 去除block开始的空格
" KeepEmptyLinesAtTheStartOfBlocks: false
let s:style_cpp['KeepEmptyLinesAtTheStartOfBlocks'] = 'true'

" 该模板对C, C++, ObjectiveC, ObjectiveC++都有效
" Language: Cpp
" let s:style_cpp['Language'] = 'Cpp'

" 最大连续空行数为1
" MaxEmptyLinesToKeep: 1
let s:style_cpp['MaxEmptyLinesToKeep'] = 2

" 针对OC的block的缩进宽度
" ObjCBlockIndentWidth: 4

" 针对OC的属性名后加空格
" ObjCSpaceAfterProperty: true

" 针对OC的协议列表前加空格
" ObjCSpaceBeforeProtocolList: true

" 指针向右对齐: 即靠近指针变量名
" PointerAlignment: Right, Middle, Left
let s:style_cpp['PointerAlignment'] = 'Right'
let s:style_cpp['DerivePointerAlignment'] = 'true'

" 括号后加空格
" SpaceAfterCStyleCast: true

" 赋值运算符前加空格
" SpaceBeforeAssignmentOperators: true

" 只在条件表示示括号前加上空格
" SpaceBeforeParens: ControlStatements
" let s:style_cpp['SpaceBeforeParens'] = 'ControlStatements'

" 行尾的注释前加1个空格
" SpacesBeforeTrailingComments: 1
let s:style_cpp['SpacesBeforeTrailingComments'] = 2

" 是否在容器字面量(@[ @"1", @"2" ])中插入空格
" SpacesInContainerLiterals: true

" 不在括号里加空格
" SpaceInEmptyParentheses: false
" SpacesInAngles: false
" SpacesInCStyleCastParentheses: false
" SpacesInParentheses: false
" SpacesInSquareBrackets: false

" 格式兼容C++11
" Standard: Cpp11
let s:style_cpp['Standard'] = 'C++11'

" 缩进宽度
" IndentWidth: 4
" 将4个空格代替tab, 不使用tab
" TabWidth: 4
" UseTab: Never
"在续行(\ 下一行)时的缩进长度
" ContinuationIndentWidth: 4
let s:style_cpp['ContinuationIndentWidth'] = 4
let s:style_cpp['IndentWidth'] = 4
let s:style_cpp['TabWidth'] = 4
let s:style_cpp['UseTab'] = 'Never'
let s:style_cpp['ContinuationIndentWidth'] = 4

function! s:get_keyval(key, val) abort
    if type(a:val) == type({})
        return a:key . ': ' . s:stringize_options(a:val)
    else
        return a:key . ': ' . a:val
    endif
endfunction

function! s:stringize_options(opts) abort
    let l:keyvals = map(items(a:opts), 's:get_keyval(v:val[0], v:val[1])')
    return '{' . join(l:keyvals, ', ') . '}'
endfunction

function! s:make_clangformt()
    return printf("'clang-format -lines=' . a:firstline . ':' . a:lastline"
        \ . " . ' --assume-filename=\"' . expand('%:p') . '\" -style=\"%s\"'",
        \ s:stringize_options(s:style_cpp))
endfunction

let g:formatdef_clangformat = s:make_clangformt()
let g:formatdef_autopep8 = '"autopep8 -" . (g:DoesRangeEqualBuffer(a:firstline, a:lastline) ? " --range " . a:firstline . " " . a:lastline : "") . " --max-line-length=100"'
let g:formatdef_jsbeautify_javascript = '"js-beautify -j -f - -".(&expandtab ? "s ".shiftwidth() : "t").(&textwidth ? " -w ".&textwidth : "")'
