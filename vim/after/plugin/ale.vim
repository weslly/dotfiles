let g:ale_enabled = 0
" let g:ale_sign_error = '✖'
" let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE guifg=#F34833
highlight ALEWarningSign ctermbg=NONE guifg=#F4B82E

let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']

" let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint']
\}
let g:ale_fixers = {
\   'python': ['yapf', 'add_blank_lines_for_python_control_statements', 'remove_trailing_lines'],
\   'javascript': ['eslint', 'prettier'],
\   'css': ['prettier']
\}
