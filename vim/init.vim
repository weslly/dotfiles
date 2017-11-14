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

set clipboard=unnamed
set mouse=a
set hidden
set foldenable
set virtualedit=block
set showmatch
set number
set backspace=indent,eol,start
set complete-=i
set nrformats-=octal
set wildmenu
set formatoptions+=j " Delete comment character when joining commented lines
set autoread
set history=1000
set cursorline
set display+=lastline

" Splits
set splitbelow
set splitright

" Indent
set autoindent
set shiftwidth=2
set expandtab
set shiftround
set smarttab

" Scroll
set scrolloff=1
set sidescrolloff=5
set scrolljump=5

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
set statusline=%<\ %f\ %m%r%w%=%y\ \ %l,%-3c\ %p%%

set path+=**
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.min.*,bundle.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*

set undofile
set undodir=/tmp/
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" }}}

let g:mapleader= ' '


" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja', {'for': ['jinja', 'jinja2', 'html', 'jinja.html']}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'bronson/vim-visual-star-search'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'zchee/deoplete-jedi', {'for': ['python']}
Plug 'mattn/emmet-vim', { 'for': ['scss', 'css', 'php.html', 'html', 'htmldjango', 'jinja.html', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
call plug#end()
" }}}

let g:gruvbox_invert_selection = 0
set background=dark
colorscheme gruvbox

let g:UltsSnipsExpandTrigger='<tab>'

let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
let g:netrw_winsize = -28
let g:netrw_liststyle = 3

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh']
let g:deoplete#auto_complete_delay = 0

if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

nnoremap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
inoremap jj <esc>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
inoremap <C-U> <C-G>u<C-U>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
noremap <C-p> :Files<cr>
nnoremap <silent> <leader><leader> :Files<cr>
nnoremap <leader>o :Buffers<CR>
nnoremap <silent> <Leader>h :Helptags<cr>
map <up> <Nop>
map <down> <Nop>
map <left> <Nop>
map <right> <Nop>


" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!
  " Strip trailing whitespace on save
  autocmd FileType python,php autocmd BufWritePre <buffer> %s/\s\+$//e

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

augroup END


if has('patch-8.0.1238')
  augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter [/\?] :set hlsearch
    autocmd CmdlineLeave [/\?] :set nohlsearch
  augroup END
endif


" }}}

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
" UltiSnips               " Snippets
" filetype.vim            " File-type settings
" }}}


" vim: fdm=marker:path=~/.config/nvim/**
