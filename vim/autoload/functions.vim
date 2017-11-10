function! functions#StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

function! functions#StartProfile()
  profile start profile.log
  profile func *
  profile file *
endfunction

function! functions#EndProfile()
  profile pause
  noautocmd qall!
endfunction

