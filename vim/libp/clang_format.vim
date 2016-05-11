"
" Copyright (C) distroy
"


" let g:clang_format#code_style   = 'google'
" let g:clang_format#auto_format_on_insert_leave = 1

nnoremap <F11> :ClangFormat<CR>


let s:style = {}

let s:style1 = {}
let s:style1['cpp'] = {}
let s:style1['javascript'] = {}


" 基础样式
" BasedOnStyle: LLVM
let s:style['BasedOnStyle'] = 'google'

let s:style['AlignEscapedNewlinesLeft'] = 'true'

let s:style['AlwaysBreakTemplateDeclarations'] = 'true'

" 类的访问修饰关键字(private, public, protected···)缩进
" private:
" int a;
" 1表示不缩进
" 大于1的值表示访问修饰关键字的左侧从int a的左侧列开始往右侧移动的距离
" AccessModifierOffset: 1
let s:style['AccessModifierOffset'] = -4

" 在未封闭(括号的开始和结束不在同一行)的括号中的代码是否对齐, 例如
" if (a &&
"     b)
" AlignAfterOpenBracket: true
let s:style['AlignAfterOpenBracket'] = 'false'
let s:style1['javascript']['AlignAfterOpenBracket'] = 'AlwaysBreak'

" 多行赋值语句按=号对齐
" AlignConsecutiveAssignments: false
let s:style['AlignConsecutiveAssignments'] = 'true'

" 多行声明语句按=号对齐
" AlignConsecutiveDeclarations: false
let s:style['AlignConsecutiveDeclarations'] = 'true'

" 行尾注释对齐
" AlignTrailingComments: true
let s:style['AlignTrailingComments'] = 'true'

" 不支持一行的函数
" AllowShortFunctionsOnASingleLine: None
let s:style['AllowShortFunctionsOnASingleLine'] = 'true'
let s:style1['javascript']['AllowShortFunctionsOnASingleLine'] = 'false'

" 不支持一行的循环体
" AllowShortLoopsOnASingleLine: false
let s:style['AllowShortLoopsOnASingleLine'] = 'false'

" 不支持一行的条件判断语句
" AllowShortIfStatementsOnASingleLine: false
let s:style['AllowShortIfStatementsOnASingleLine'] = 'false'

" 圆括号的换行方式
" BreakBeforeBraces: Attach
let s:style['BreakBeforeBraces'] = 'Attach'

" 在构造函数初始化时按逗号断行，并以冒号对齐
" BreakConstructorInitializersBeforeComma: true
let s:style['BreakConstructorInitializersBeforeComma'] = 'true'

" 每行字符的长度
" ColumnLimit: 120
let s:style['ColumnLimit'] = 80

"在续行(\
"     下一行)时的缩进长度
" ContinuationIndentWidth: 4
let s:style['ContinuationIndentWidth'] = 4

" 格式兼容C++11
" Cpp11BracedListStyle: true
let s:style['Cpp11BracedListStyle'] = 'true'

" 禁用当前format文件
" DisableFormat: false

" switch的case缩进
" IndentCaseLabels: true
let s:style['IndentCaseLabels'] = 'false'

" 缩进宽度
" IndentWidth: 4

" 去除block开始的空格
" KeepEmptyLinesAtTheStartOfBlocks: false

" 该模板对C, C++, ObjectiveC, ObjectiveC++都有效
" Language: Cpp

" let s:style['Language'] = 'Cpp'
" 最大连续空行数为1
" MaxEmptyLinesToKeep: 1
let s:style['MaxEmptyLinesToKeep'] = 2

" 针对OC的block的缩进宽度
" ObjCBlockIndentWidth: 4

" 针对OC的属性名后加空格
" ObjCSpaceAfterProperty: true

" 针对OC的协议列表前加空格
" ObjCSpaceBeforeProtocolList: true

" 最多能超出ColumnLimit多少个字符
" PenaltyExcessCharacter: 0
let s:style['PenaltyExcessCharacter'] = 20

" 指针向右对齐: 即靠近指针变量名
" PointerAlignment: Right
let s:style['PointerAlignment'] = 'Right'
let s:style['DerivePointerAlignment'] = 'true'

" 括号后加空格
" SpaceAfterCStyleCast: true

" 赋值运算符前加空格
" SpaceBeforeAssignmentOperators: true

" 只在条件表示示括号前加上空格
" SpaceBeforeParens: ControlStatements

" let s:style.SpaceBeforeParens = 'ControlStatements'
" 行尾的注释前加1个空格
" SpacesBeforeTrailingComments: 1

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
let s:style['Standard'] = 'C++11'

" 将4个空格代替tab, 不使用tab
" TabWidth: 4
let s:style['TabWidth'] = 4

" UseTab: Never
let s:style['UseTab'] = 'Never'

let g:clang_format#style_options = s:style
let g:clang_format#filetype_style_options = s:style1
