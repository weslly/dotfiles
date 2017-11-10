" FZF
"
let $FZF_DEFAULT_COMMAND= 'ag --ignore="*.map" --ignore="*.pyc" --ignore="*.png" --ignore="*.jpg" --ignore="*.gif" --ignore="bower_components/*" --ignore="fonts/*" -g ""'

let g:fzf_files_options = $FZF_CTRL_T_OPTS
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_commits_log_options = substitute(system("git config --get alias.l | awk '{$1=\"\"; print $0;}'"), '\n\+$', '', '')
let g:fzf_history_dir = '~/.fzf-history'

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

function! s:ag_to_qf(line) abort
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines) abort
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
              \ 'ctrl-v': 'vertical split',
              \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

" \ 'source':  printf('ag --nogroup --column --color %s',
" \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'sink':    'Explore'})

  " \   'rg --vimgrep --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --vimgrep --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color %s',
\                   escape(empty(<q-args>) ? '"^(?=.)"' : <q-args>, '\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

command! -nargs=* Todo call fzf#run({
\ 'source':  printf('ag --nogroup --column --color -i \(FIXME\|TODO\|XXX\): %s',
\                   escape(empty(<q-args>) ? '' : <q-args>, '\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

