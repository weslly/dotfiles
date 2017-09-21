
" Trim whitespace on save
augroup TrimWhiteSpace
    autocmd BufWritePre * :call functions#StripTrailingWhitespace()
augroup END

"
" Automatically equalize splits when Vim is resized
augroup VimRez
    autocmd VimResized * wincmd =
augroup END

