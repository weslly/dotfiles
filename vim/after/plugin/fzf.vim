" let $FZF_DEFAULT_COMMAND= 'ag --ignore="*.map" --ignore="*.pyc" --ignore="*.png" --ignore="*.jpg" --ignore="*.gif" --ignore="bower_components/*" --ignore="fonts/*" -g ""'
let $FZF_DEFAULT_COMMAND= 'fd --hidden --follow --no-ignore-vcs --exclude=".DS_Store" --exclude="*.map" --exclude="*.pyc" --exclude="*.png" --exclude="*.jpg" --exclude="*.gif" --exclude="dist/*"  --exclude="bower_components/*" --exclude="fonts/*"  --exclude ".git/*" --exclude "node_modules/*" --type f'

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

" ----------------------------------------------------------------------------
" BTags
" ----------------------------------------------------------------------------
function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=pattern --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({'source':  s:btags_source(),
                 \'down':    '30%',
                 \'options': '+m -d "\t" --with-nth 1,4..',
                 \'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()

function! Fzf_files_with_dev_icons(preview)
  if a:preview > 0
    let l:fzf_files_options = ' -m --preview "bat --color always --map-syntax vue:html --theme=1337 --style numbers {2..} | head -'.&lines.'"'
  else    
    let l:fzf_files_options = ' -m'
  endif

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

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --layout=reverse'

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)

    if &columns < 140
      let width = float2nr(&columns - (&columns * 2 / 10))
    else
      let width = 140
    endif

    let height = float2nr(&lines / 2)
    let col = float2nr((&columns - width) / 2)

    let opts = {
          \ 'relative': 'editor',
          \ 'row': 1,
          \ 'col': col,
          \ 'width': width,
          \ 'height': height
          \ }

    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhl', 'NormalFloat:Pmenu')

    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
          \ nonumber
          \ norelativenumber
          \ signcolumn=no
  endfunction
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

map <C-p> :call Fzf_files_with_dev_icons(0)<CR>
map <leader>r :BTags<CR>
