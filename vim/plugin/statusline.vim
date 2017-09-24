" vim: sw=2:ts=2
scriptencoding utf-8
set noshowmode
" Statusline

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

function! GitInfo()
  let l:git = fugitive#head()
  if l:git !=? ''
    return ' '.fugitive#head()
  else
    return ''
  endif
endfunction

function! ChangeStatuslineColor(mode)
  if (a:mode =~# '\v(v|V|)' || g:currentmode[a:mode] ==# 'V·BLOCK ' || get(g:currentmode, a:mode, '') ==# 't')
    highlight StatusLine guifg=#FE8018 guibg=None
  elseif (a:mode =~# '\v(R|Rv)')
    highlight StatusLine guifg=#D3869B guibg=None
  elseif (a:mode ==# 'i')
    highlight StatusLine guifg=#B8BB25 guibg=None
  else
    highlight StatusLine guifg=#8EC07C guibg=None
  endif
  return ''
endfunction


augroup StatusLineUpdate
  autocmd!
  if exists('#TextChangedI')
    autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * call ChangeStatuslineColor(mode())
  else
    autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * call ChangeStatuslineColor(mode())
  endif
augroup END

" function! SetCursorLineNrColorVisual()
"   highlight StatusLine guifg=#FE8018 guibg=None
"   return ''
" endfunction

" vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
" nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual<left><right>
" nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual<left><right>
" nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual<left><right>

set laststatus=2
set statusline=%0*
set statusline+=%{ChangeStatuslineColor(mode())}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\  " Encoding & Fileformat
set statusline+=%8*\ %3p%%\ \ %l:%c\                 " Rownumber/total (%)
