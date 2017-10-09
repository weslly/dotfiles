" vim: ts=2:sw=2:fdm=marker
filetype on
filetype plugin indent on

if has('nvim')
  set termguicolors
endif

set clipboard=unnamed
set hidden
set autoindent
set shiftwidth=2
" set softtabstop=2
set expandtab
set shiftround
set ignorecase
set smartcase
set foldenable
set mouse=a
set splitbelow
set splitright
set noswapfile
set nobackup
set virtualedit=block
set timeoutlen=500
set showmatch
set number
set noshowmode

if exists('&inccommand')
  set inccommand=split
endif

let g:mapleader= ' '

" Vim-Plug
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'lepture/vim-jinja', {'for': ['jinja', 'jinja2', 'jinja.html']}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-visual-star-search'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'zchee/deoplete-jedi', {'for': ['python']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
" Plug 'w0rp/ale', {'for': ['python']}

Plug 'mattn/emmet-vim', { 'for': ['scss', 'css', 'html', 'htmldjango', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
call plug#end()

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

let g:UltiSnipsExpandTrigger='<tab>'

let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
let g:netrw_winsize = -28
let g:netrw_liststyle = 3

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

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
nnoremap <silent> <esc> :nohlsearch<CR>

augroup AutoReloadVimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC nested silent source $MYVIMRC
augroup END


" Project specific override
"================================================================================
let s:vimrc_project = $PWD . '/.local.vim'
if filereadable(s:vimrc_project)
  execute 'source ' . s:vimrc_project
endif

" Other files {{{
"
" plugin/autocmd.vim      " Auto Commands
" plugin/commands.vim     " Commands
" plugin/autosession.vim  " Auto-Session Plugin
" plugin/statusline.vim   " Statusline
" after/plugin            " Plugin Settings
" autoload/functions.vim  " Functions
" ftplugin                " File-type plugins
" UltiSnips               " Snippets
" filetype.vim            " File-type settings
"
" }}}
"
