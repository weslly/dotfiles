function! autosession#SaveSess(new) abort
  if g:VimAutoSessionDisable ==? 0 || a:new
    let g:VimAutoSessionDisable = 0
    if a:new || filereadable(getcwd() . '/.session.vim')
      execute 'mksession! ' . getcwd() . '/.session.vim'
    endif
  endif
endfunction

function! autosession#RestoreSess() abort
  if @% ==? '' && filereadable(getcwd() . '/.session.vim')
    let g:VimAutoSessionDisable = 0
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
      for l:l in range(1, bufnr('$'))
        if bufwinnr(l:l) == -1
          exec 'sbuffer ' . l:l
        endif
      endfor
    endif
  else
    let g:VimAutoSessionDisable = 1
  endif
endfunction

augroup VimAutoSession
  autocmd VimLeave * call autosession#SaveSess(0)
  autocmd VimEnter * nested call autosession#RestoreSess()
augroup END

command! SaveSession call autosession#SaveSess(1)
