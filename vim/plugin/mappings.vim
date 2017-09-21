let g:mapleader= ' '

" Repeat macro @q
nnoremap Q @q

" nmap <F8> :TagbarToggle<CR>

nnoremap <leader>] :call functions#NumberToggle()<cr>


"Clear search highlighting when esc is pressed
nnoremap <esc> :noh<return><esc>

"Fold tags
nnoremap <leader>ft Vatzf

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>l

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :tabedit $MYVIMRC<cr>

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

noremap <leader>n :Lex<cr>


" better buffer navigation
nmap <F3> :bnext<CR>
nmap <F2> :bprev<CR>
nmap <F4> :Sayonara!<CR>
nmap <leader>o :Buffers<CR>

imap jj <esc>
