let b:ale_linter_aliases = ['javascript']
let b:ale_linters = ['eslint']

nnoremap <silent> <leader>= :ALEFix eslint<CR>
" nnoremap <silent> <leader>= :%!npx eslint --stdin --stdin-filename % --fix-dry-run -f json <bar> jq '.[0].output' -r<CR>
