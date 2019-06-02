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
  set guifont=mononokiNerdFontComplete-Regular:h13
  " set guioptions=
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
" set statusline=%<\ %f\ %m%r%w%=%y\ \ %l,%-3c\ %p%%\ "

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
set directory=~/.local/share/nvim/swap,/tmp/

if has('folding')
  set foldmethod=indent
  set foldlevelstart=999
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" }}}

let g:mapleader= ' '

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'

" Essentials

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-sleuth'
Plug 'bronson/vim-visual-star-search'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'

Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'vimwiki/vimwiki'
" Plug 'lepture/vim-jinja', {'for': ['jinja', 'jinja2', 'html', 'jinja.html']}

" NCM 2
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-abbrfuzzy'
Plug 'ncm2/ncm2-cssomni'

Plug 'tpope/vim-fugitive'

Plug 'christoomey/vim-tmux-navigator'

Plug 'mattn/emmet-vim', { 'for': ['less', 'scss', 'css', 'html.php', 'html', 'htmldjango', 'jinja.html', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php', 'vue'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'

" Bells and whistles
" Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
" Plug 'airblade/vim-gitgutter'

Plug 'ludovicchabant/vim-gutentags'
" Plug 'jsfaint/gen_tags.vim'

" PHP
Plug 'akiyan/vim-textobj-php'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vifm/vifm.vim'

" C/C++
" Plug 'ericcurtin/CurtineIncSw.vim'
call plug#end()
" }}}
"

" Colorscheme
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox

" Plugin config
let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'javascript']
let g:AutoPairsMultilineClose = 0
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:UltsSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='●'
let g:gitgutter_sign_removed='-'
let g:gitgutter_sign_removed_first_line=''
let g:gitgutter_sign_modified_removed='●-'

let g:tagbar_type_vue = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'f:functions',
      \ 'c:classes',
      \ 'm:methods',
      \ 'C:constants',
      \ 'v:global variables',
      \ 'g:generators'
      \ ]}

" (Re)maps
nnoremap <silent> <leader>h :call CurtineIncSw()<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
noremap Q @q
nnoremap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
inoremap jj <esc>
inoremap <C-U> <C-G>u<C-U>
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" noremap <C-p> :Files<cr>
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

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" nmap <silent> <leader>k :NERDTreeToggle<cr>
" nmap <silent> <leader>m :NERDTreeFind<cr>

nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" let NERDTreeHijackNetrw=1
" let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
" let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
" let NERDTreeNodeDelimiter = "\u263a" " smiley face
" let NERDTreeDirArrowExpandable = ' '
" let NERDTreeDirArrowCollapsible = ' '

" if exists('g:loaded_webdevicons')
"   call webdevicons#refresh()
" endif

cnoremap %% <C-R>=expand('%:h').'/'<cr>
command! Reveal :silent exec "!open -R %"

" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!

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

  autocmd FileType vue syntax sync fromstart
augroup END

augroup customHighlights
  autocmd!
  if !has('gui') && !has('gui_vimr')
    hi Normal guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
  endif
augroup END

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
