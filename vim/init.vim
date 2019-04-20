filetype on
filetype plugin indent on
syntax enable

" Settings {{{
if has('nvim')
  set timeoutlen=500
else
  set ttimeout
  set ttimeoutlen=100
endif

if exists('&termguicolors')
  set termguicolors
endif

if !has('nvim') && exists('&ttymouse')
  set ttymouse=xterm2
endif

if has('gui')
  set guioptions=
endif

set clipboard=unnamed
set mouse=a
set hidden
set foldenable
set virtualedit=block
set showmatch
set number
set backspace=indent,eol,start
set complete-=i
set completeopt=noinsert,menuone
set wildmenu
set formatoptions+=j " Delete comment character when joining commented lines
set autoread
set history=1000
set display+=lastline
" set cursorline
set scroll=5 " number of lines to scroll with ctrl-d/u
set synmaxcol=1500
set shortmess+=c
set pumheight=10 " autocomplete max height
set lazyredraw

" Splits
set splitbelow
set splitright

" Indent
" set autoindent
set shiftwidth=2
set expandtab
set shiftround
set smarttab

" Search 
set incsearch
set hlsearch
set ignorecase
set smartcase

if exists('&inccommand')
  set inccommand=split
endif

if executable('rg')
  " set grepprg=ag\ --nogroup\ --column\ --vimgrep
  set grepprg=rg\ -H\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" Statusline
set laststatus=2
set statusline=%<\ %f\ %m%r%w%=%y\ \ %l,%-3c\ %p%%\ "

set path+=**
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.min.*,bundle.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*,*/dist/*
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*

set undofile
set undodir=/tmp/
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap

if has('folding')
  set foldmethod=indent
  set foldlevelstart=999
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" }}}

let g:python3_host_prog = '/usr/local/bin/python3'
let g:mapleader= ' '

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-sleuth'
Plug 'bronson/vim-visual-star-search'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'

Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
Plug 'lepture/vim-jinja', {'for': ['jinja', 'jinja2', 'html', 'jinja.html']}
Plug 'davidhalter/jedi-vim', {'for': ['python']}

Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-abbrfuzzy'
Plug 'ncm2/ncm2-cssomni'
" Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-pyclang'

Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/emmet-vim', { 'for': ['less', 'scss', 'css', 'html.php', 'html', 'htmldjango', 'jinja.html', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php', 'vue'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'

" PHP
Plug 'akiyan/vim-textobj-php'
Plug 'whatyouhide/vim-textobj-xmlattr'
" Plug 'captbaritone/better-indent-support-for-php-with-html'

Plug 'jwalton512/vim-blade'
" Plug 'airblade/vim-gitgutter'

Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-scripts/Sass'
" Plug 'artemave/vjs'
Plug 'iloginow/vim-stylus'

" Plug 'Yggdroot/indentLine'

Plug 'tpope/vim-fugitive'
" C/C++
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'majutsushi/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'AndrewRadev/switch.vim'
Plug 'RRethy/vim-hexokinase'
Plug 'kalekundert/vim-prima-facie'
Plug 'meain/vim-package-info', { 'do': 'npm install' }
call plug#end()
" }}}
"

" Colorscheme
set background=dark
colorscheme base16-gruvbox-dark-hard
" colorscheme gruvbox

" Plugin config
let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'javascript']
let g:ncm2_pyclang#library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:AutoPairsMultilineClose = 0
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:UltsSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" (Re)maps
nnoremap <silent> <leader>h :call CurtineIncSw()<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
noremap Q @q
nnoremap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
inoremap jj <esc>
inoremap <C-U> <C-G>u<C-U>
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
noremap <C-p> :Files<cr>
nnoremap <silent> <leader><leader> :Files<cr>
nnoremap <leader>o :Buffers<CR>
nnoremap <F3> :vnew<cr>:setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile noundofile<cr>
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Make better undo chunks when writing long texts (prose) without exiting insert mode.
" :h i_CTRL-G_u
" https://twitter.com/vimgifs/status/913390282242232320
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

cnoremap %% <C-R>=expand('%:h').'/'<cr>
command! Reveal :silent exec "!open -R %"

" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!

  " Fix quickfix location when tagbar is open
  autocmd FileType qf wincmd J

  " Strip trailing whitespace on save
  autocmd FileType python,php autocmd BufWritePre <buffer> %s/\s\+$//e

  autocmd BufEnter * call ncm2#enable_for_buffer()

  " Automatically equalize splits when Vim is resized
  autocmd VimResized * wincmd =

  " See :h last-position-jump
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif

  " Auto reload vimrc on save
  autocmd BufWritePost $MYVIMRC,~/.vimrc nested silent source $MYVIMRC

  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow

  " I keep forgetting I can't close :help with `q`
  autocmd FileType help map <buffer> q :close<cr>

  " autocmd FileType php,python setlocal keywordprg '\!open dash://'

  if executable('prettier')
    autocmd FileType scss setlocal formatprg=prettier\ --stdin\ --parser\ scss
    " autocmd BufWritePre *.scss norm gg=G
  endif

  autocmd FileType vue syntax sync fromstart

augroup END

augroup customHighlights
  autocmd!

  if !has('gui') && !has('gui_vimr')
    hi Normal guibg=NONE ctermbg=NONE
  endif
augroup END

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Project specific override {{{
let s:vimrc_project = $PWD . '/.local.vim'
if filereadable(s:vimrc_project)
  execute 'source ' . s:vimrc_project
endif
" }}}

" Other files {{{
" plugin/autosession.vim  " Auto-Session Plugin
" after/plugin            " Plugin Settings
" autoload/functions.vim  " Functions
" ftplugin                " File-type plugins
" ftdetect                " File-type detect
" UltiSnips               " Snippets
" }}}

" vim: fdm=marker:path=~/.config/nvim/**
