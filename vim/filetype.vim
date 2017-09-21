" Setting filetypes with high prio, see |new-filetype|
if exists('did_load_filetypes')
  finish
endif

augroup filetypedetect
  autocmd! BufNewFile,BufRead .tags setl filetype=tags
augroup END

