function! LightlineFilename()
  return &filetype ==# 'fzf' ? 'FZF' :
        \ expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
endfunction

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
