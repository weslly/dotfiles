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

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'sink':    'Explore'})

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



" Files + devicons
function! Fzf_files_with_dev_icons(command)
  let l:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
   function! s:edit_devicon_prepended_file(item)
    let l:file_path = a:item[4:-1]
    execute 'silent e' l:file_path
  endfunction
   call fzf#run({
        \ 'source': a:command.' | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
"  function! Fzf_git_diff_files_with_dev_icons()
"   let l:fzf_files_options = '--ansi --preview "sh -c \"(git diff --color=always -- {3..} | sed 1,4d; bat --color always --style numbers {3..}) | head -'.&lines.'\""'
"    function! s:edit_devicon_prepended_file_diff(item)
"     echom a:item
"     let l:file_path = a:item[7:-1]
"     echom l:file_path
"     let l:first_diff_line_number = system("git diff -U0 ".l:file_path." | rg '^@@.*\+' -o | rg '[0-9]+' -o | head -1")
"      execute 'silent e' l:file_path
"     execute l:first_diff_line_number
"   endfunction
"    call fzf#run({
"         \ 'source': 'git -c color.status=always status --short --untracked-files=all | devicon-lookup',
"         \ 'sink':   function('s:edit_devicon_prepended_file_diff'),
"         \ 'options': '-m ' . l:fzf_files_options,
"         \ 'down':    '40%' })
" endfunction

 " Open fzf Files " Open fzf Files
map <C-f> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND)<CR>
" map <C-d> :call Fzf_git_diff_files_with_dev_icons()<CR> " :GFiles?
" map <C-g> :call Fzf_files_with_dev_icons("git ls-files \| uniq")<CR> " :GFiles
