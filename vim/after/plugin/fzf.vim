" let $FZF_DEFAULT_COMMAND= 'ag --ignore="*.map" --ignore="*.pyc" --ignore="*.png" --ignore="*.jpg" --ignore="*.gif" --ignore="bower_components/*" --ignore="fonts/*" -g ""'
let $FZF_DEFAULT_COMMAND= 'fd --hidden --follow --no-ignore-vcs --exclude=".DS_Store" --exclude="*.map" --exclude="*.pyc" --exclude="*.png" --exclude="*.jpg" --exclude="*.gif" --exclude="bower_components/*" --exclude="fonts/*"  --exclude ".git/*" --exclude "node_modules/*" --type f'

" let g:fzf_files_options = $FZF_CTRL_T_OPTS
" let g:fzf_layout = { 'window': 'enew' }
let g:fzf_commits_log_options = substitute(system("git config --get alias.l | awk '{$1=\"\"; print $0;}'"), '\n\+$', '', '')
let g:fzf_history_dir = '~/.fzf-history'

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

command! -nargs=* Todo call fzf#run({
\ 'source':  printf('ag --nogroup --column --color -i \(FIXME\|TODO\|XXX\): %s',
\                   escape(empty(<q-args>) ? '' : <q-args>, '\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

function! Fzf_files_with_dev_icons()
  let l:fzf_files_options = ' -m --preview "bat --color always --map-syntax vue:html --theme=1337 --style numbers {2..} | head -'.&lines.'"'

  function! s:edit_devicon_prepended_file(items)
    let items = a:items
    let i = 1
    let ln = len(items)
    while i < ln
      let item = items[i]
      let parts = split(item, ' ')
      let file_path = get(parts, 1, '')
      let items[i] = file_path
      let i += 1
    endwhile
    call s:Sink(items)
  endfunction

  let opts = fzf#wrap({})
  let opts.source = $FZF_DEFAULT_COMMAND .' | devicon-lookup'
  let s:Sink = opts['sink*']
  let opts['sink*'] = function('s:edit_devicon_prepended_file')
  let opts.down = '30%'
  let opts.options .= l:fzf_files_options
  call fzf#run(opts)
endfunction

 " Open fzf Files " Open fzf Files
map <C-p> :call Fzf_files_with_dev_icons()<CR>
" map <C-p> :call FZFWithDevIcons()<CR>
map <C-f> :Files<CR>
" map <C-d> :call Fzf_git_diff_files_with_dev_icons()<CR> " :GFiles?
" map <C-g> :call Fzf_files_with_dev_icons("git ls-files \| uniq")<CR> " :GFiles
