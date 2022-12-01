"
" Copyright (C) distroy
"


if !g:ld.plug.has('vim-go') | finish | endif

let g:go_template_autocreate = 0
let g:go_fold_enable = ['block', 'import', 'varconst', 'comment', 'package_comment']

let g:go_doc_popup_window = 1
let g:go_imports_autosave = 1
let g:go_fmt_autosave = 1

let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 0
let g:go_highlight_variable_assignments = 0
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 0
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 0

let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0

let g:go_code_completion_enabled = 0

let g:go_def_mapping_enabled = 0
" autocmd FileType go nnoremap <buffer> <silent> <C-w><C-]> :<C-u>call go#def#Jump("tab", 0)<CR>
" autocmd FileType go nnoremap <buffer> <silent> <C-w>] :<C-u>call go#def#Jump("tab", 0)<CR>

let g:go_list_autoclose = 0
let g:go_version_warning = 0
let g:go_code_completion_enabled = 0

let g:go_jump_to_error = 0
let g:go_fmt_fail_silently = 1
let g:go_list_autoclose = 0
let g:go_echo_go_info = 0
