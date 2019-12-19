let b:ale_linter_aliases = ['javascript']
let b:ale_linters = ['eslint']

nnoremap <silent> <leader>= :!npx eslint % --fix<CR>
