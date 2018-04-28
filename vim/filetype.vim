augroup FileTypeExec
  if executable('prettier')
    autocmd FileType scss setlocal formatprg=prettier\ --stdin\ --parser\ scss | setlocal equalprg=prettier\ --stdin\ --parser\ scss
  endif
augroup END
