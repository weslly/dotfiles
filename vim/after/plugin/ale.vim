scriptencoding utf-8

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

let g:ale_linters = {
\   'python': ['flake8'],
\   'html': [],
\   'css': []
\}
let g:ale_fixers = {
\   'python': ['yapf', 'add_blank_lines_for_python_control_statements', 'remove_trailing_lines']
\}
