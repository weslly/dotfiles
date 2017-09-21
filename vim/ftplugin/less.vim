setlocal softtabstop=2
setlocal tabstop=2
setlocal shiftwidth=2

" autocmd BufEnter * :syntax sync fromstart
"
" if !exists('g:less_autocompile')
"   let g:less_autocompile = 0
" endif
" if !exists('g:less_compress')
"   let g:less_compress = 1
" endif
" if system('which lessc') != ''
" autocmd BufWritePost *.less call s:auto_less_compile()
"
" function! s:auto_less_compile() " {{{
" if g:less_compress != 0
"   let compress_option = ' -x '
" else
"   let compress_option = ''
" endif
" if g:less_autocompile != 0
"   try
"     let css_name = expand("%:r") . ".css"
"     let less_name = expand("%")
"     if filereadable(css_name) || 0 < getfsize(less_name)
"       silent execute ':AsyncRun lessc ' . compress_option . less_name . ' ' . css_name . ' 2> /dev/null'
"     endif
"   endtry
" endif
" endfunction " }}}
" endif
