let g:mapleader= ' '

" Repeat macro @q
nnoremap Q @q

nnoremap <leader>] :call functions#NumberToggle()<cr>

"Clear search highlighting when esc is pressed
nnoremap <esc> :noh<return><esc>

"Fold tags
nnoremap <leader>ft Vatzf

"Shortcut for editing  vimrc file in a new tab
nmap <leader>ev :e $MYVIMRC<cr>

"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

" better buffer navigation
nmap <F3> :bnext<CR>
nmap <F2> :bprev<CR>
nmap <leader>o :Buffers<CR>

imap jj <esc>
