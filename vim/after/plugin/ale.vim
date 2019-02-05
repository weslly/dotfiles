let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE guifg=#F34833
highlight ALEWarningSign ctermbg=NONE guifg=#F4B82E

let g:ale_linters = {
\   'python': ['flake8'],
\   'html': [],
\   'css': []
\}
let g:ale_fixers = {
\   'python': ['yapf', 'add_blank_lines_for_python_control_statements', 'remove_trailing_lines']
\}
