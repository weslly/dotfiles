if executable('jq')
  autocmd FileType json setlocal formatprg=jq\ .
else
  autocmd FileType json setlocal formatprg=python\ -m\ json.tool
endif

au! BufRead,BufNewFile .{babel,eslint,stylelint,jshint}*rc,\.tern-*,*.json setl filetype=json
