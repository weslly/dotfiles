" Setting filetypes with high prio, see |new-filetype|
" if exists('did_load_filetypes')
"   finish
" endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead php set filetype=php.html | :syntax sync fromstart
augroup END

