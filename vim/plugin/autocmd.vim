
" Trim whitespace on save
augroup TrimWhiteSpace
  autocmd!
  autocmd BufWritePre * :call functions#StripTrailingWhitespace()
augroup END

"
" Automatically equalize splits when Vim is resized
augroup VimRez
  autocmd!
  autocmd VimResized * wincmd =
augroup END
