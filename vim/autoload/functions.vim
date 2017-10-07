function! functions#NumberToggle()
  if(&relativenumber == 1)
    set number norelativenumber
  else
    set relativenumber
  endif
endfunction


function! functions#RevealInFinder()
  silent call system('open '.expand('%:p:h:~'))
endfunction

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

