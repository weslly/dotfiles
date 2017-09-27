" vim: sw=2:ts=2
scriptencoding utf-8
set noshowmode

let s:currentmode={
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


function! statusline#ReadOnly()
  if !&modifiable && &readonly
    return 'RO'
  elseif &modifiable && &readonly
    return 'RO'
  elseif !&modifiable && !&readonly
    return ''
  else
    return ''
endif
endfunction

let s:statusline_last_mode = mode()

function! statusline#ChangeStatuslineColor(mode)
  if a:mode != s:statusline_last_mode
    if (a:mode =~# '\v(v|V||s|S|)' || s:currentmode[a:mode] ==# 'V·BLOCK ' || get(s:currentmode, a:mode, '') ==# 't')
      highlight User1 guibg=#FE8018 guifg=#3C3836
    elseif (a:mode =~# '\v(R|Rv)')
      highlight User1 guibg=#D3869B guifg=#3C3836
    elseif (a:mode ==# 'i')
      highlight User1 guibg=#B8BB25 guifg=#3C3836
    else
      highlight User1 guibg=#8EC07C guifg=#3C3836
    endif
    redrawstatus
    let s:statusline_last_mode = a:mode
  endif
  return ''
endfunction

augroup statusline
  autocmd!
  autocmd InsertEnter,InsertLeave * call statusline#ChangeStatuslineColor(mode())
augroup END


highlight StatusLine guifg=#3C3836 guibg=#E4DCB6
highlight User1 guibg=#8EC07C guifg=#3C3836 gui=bold cterm=bold term=bold

function! statusline#GetMode() abort
  return get(s:currentmode, mode(), '')
endfunction

set laststatus=2
set statusline=%0*
set statusline+=%{statusline#ChangeStatuslineColor(mode())}     " Update statusline mode color
set statusline+=%1*\ %{toupper(statusline#GetMode())}           " Current Mode
set statusline+=%0*\ %<%F\ %{statusline#ReadOnly()}\ %m\ %w\    " File+path
set statusline+=%*
set statusline+=%0*\ %=                                         " Space
set statusline+=%0*\ %y\                                        " FileType
set statusline+=%0*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\        " Encoding & Fileformat
set statusline+=%0*\ %3p%%\ \ \%l:%c\                           " Rownumber/total (%)


