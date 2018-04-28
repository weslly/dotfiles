let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['<?[php|=]', '?>'],
      \     'filetype': ['php'],
      \     'nesting' : 0,
      \     'linewise' : 1,
      \     'input'   : ['P'],
      \   },
      \   {
      \     'buns'    : ['<?php', '?>'],
      \     'filetype': ['php'],
      \     'nesting' : 0,
      \     'kind' : ['add'],
      \     'input'   : ['P'],
      \   }
      \ ]


augroup PHPAutoCmd
  if executable('html-beautify')
    autocmd FileType php setlocal formatprg=html-beautify\ -s\ 2
  endif
augroup END

