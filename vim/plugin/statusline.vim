" vim: sw=2:ts=2
scriptencoding utf-8

set noshowmode

let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·LINE ',
    \ '' : 'V·BLOCK ',
    \ 's'  : 'SELECT ',
    \ 'S'  : 'S·LINE ',
    \ '^S' : 'S·BLOCK ',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'REPLACE ',
    \ 'Rv' : 'V·REPLACE ',
    \ 'c'  : 'COMMAND ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'TERMINAL '
    \}


function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
  endif
endfunction

function! ChangeStatuslineColor(mode)
  if (a:mode =~# '\v(v|V||s|S|)' || g:currentmode[a:mode] ==# 'V·BLOCK ' || get(g:currentmode, a:mode, '') ==# 't')
    highlight User1 guibg=#FE8018 guifg=#3C3836
  elseif (a:mode =~# '\v(R|Rv)')
    highlight User1 guibg=#D3869B guifg=#3C3836
  elseif (a:mode ==# 'i')
    highlight User1 guibg=#B8BB25 guifg=#3C3836
  else
    highlight User1 guibg=#8EC07C guifg=#3C3836
  endif
  redrawstatus
  return ''
endfunction


highlight StatusLine guifg=#3C3836 guibg=#E4DCB6
highlight User1 guibg=#E4DCB6 guifg=#3C3836

function! GetMode() abort
  return get(g:currentmode, mode(), '')
endfunction

set laststatus=2
set statusline=%0*
set statusline+=%{ChangeStatuslineColor(mode())}               " Changing the statusline color
set statusline+=%1*\ %{toupper(GetMode())}   " Current mode
set statusline+=%0*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%*
set statusline+=%0*\ %=                                  " Space
set statusline+=%0*\ %y\                                 " FileType
set statusline+=%0*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\  " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ %l:%c\                 " Rownumber/total (%)

