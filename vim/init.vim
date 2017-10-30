filetype on
filetype plugin indent on

" Settings {{{
if has('nvim')
  set timeoutlen=500
endif

if exists('&termguicolors')
  set termguicolors
endif

" if exists('&ttymouse')
"   set ttymouse=xterm2
" endif

set clipboard=unnamed
set hidden
set autoindent
set shiftwidth=2
set expandtab
set shiftround
set ignorecase
set smartcase
set foldenable
set mouse=a
set splitbelow
set splitright
set virtualedit=block
set showmatch
set number
set scrolljump=5

set noswapfile
set nobackup

set statusline=%<\ %f\ %m%r%w%=%y\ \ %l,%-3c\ %p%%\ 

set path+=**	
set wildignore+=*/node_modules/*,*/vendor/*

if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if exists('&inccommand')
  set inccommand=split
endif
" }}}

let g:mapleader= ' '


" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja', {'for': ['jinja', 'jinja2', 'jinja.html']}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-visual-star-search'
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

let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
let g:gruvbox_contrast_light='hard'
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

nnoremap <leader>] :call functions#NumberToggle()<cr>
nnoremap <leader>ft Vatzf
nmap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
nmap <F3> :bnext<CR>
nmap <F2> :bprev<CR>
nmap <leader>o :Buffers<CR>
imap jj <esc>
cnoremap %% <C-R>=expand('%:h').'/'<cr>


" Project specific override {{{
let s:vimrc_project = $PWD . '/.local.vim'
if filereadable(s:vimrc_project)
  execute 'source ' . s:vimrc_project
endif
" }}}


" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!
  " Strip trailing whitespace on save
  " autocmd BufWritePre * :call functions#StripTrailingWhitespace()

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
augroup END

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
