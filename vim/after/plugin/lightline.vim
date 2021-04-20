if exists('g:loaded_lightline') 
 function! LightlineFilename()
   return &filetype ==# 'fzf' ? 'FZF' :
         \ expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
 endfunction

 let g:lightline = {}
"
" let g:lightline.component_expand = {
"   \   'linter_warnings': 'lightline#coc#warnings',
"   \   'linter_errors': 'lightline#coc#errors',
"   \   'linter_info': 'lightline#coc#info',
"   \   'linter_hints': 'lightline#coc#hints',
"   \   'linter_ok': 'lightline#coc#ok',
"   \   'status': 'lightline#coc#status',
"   \ }
"
" " Set color to the components:
" let g:lightline.component_type = {
"   \   'linter_warnings': 'warning',
"   \   'linter_errors': 'error',
"   \   'linter_info': 'info',
"   \   'linter_hints': 'hints',
"   \   'linter_ok': 'left',
"   \ }
"

 let g:lightline.component_function = {
       \   'filename': 'LightlineFilename',
       \ }
" register compoments:
" call lightline#coc#register()



" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_infos': 'lightline#ale#infos',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }
"
" let g:lightline.component_type = {
"       \     'linter_checking': 'right',
"       \     'linter_infos': 'right',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'right',
"       \ }
"
" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], [ 'lineinfo' ], ['percent'],  [ 'fileformat', 'fileencoding', 'filetype' ]] }

" \     'left': [[ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status', 'readonly', 'filename', 'modified'  ]]
" let g:lightline.active = {
"   \     'left': [[ 'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'readonly', 'filename', 'modified'  ]]
"   \ }

endif
