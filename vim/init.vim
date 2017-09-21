" vim: ts=2:sw=2:fdm=marker
filetype on
filetype plugin indent on

let g:gruvbox_italic=1

if has('nvim')
  set termguicolors
endif

" Other files {{{
"
" plugin/settings.vim     " Settings
" plugin/mappings.vim     " Key Mappings
" plugin/autocmd.vim      " Auto Commands
" plugin/commands.vim     " Commands
" plugin/autosession.vim  " Auto-Session Plugin
" after/plugin            " Plugin Settings
" autoload/functions.vim  " Functions
" ftplugin                " File-type plugins
" UltiSnips               " Snippets
" filetype.vim            " File-type settings
"
" }}}

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')

if !exists('g:actualvim')
  Plug 'tpope/vim-vinegar'
  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'

  Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
  Plug 'chriskempson/base16-vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'lepture/vim-jinja'
  Plug 'ryanoasis/vim-devicons'
  Plug 'mhinz/vim-sayonara'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'airblade/vim-gitgutter'
endif

" Plug 'ludovicchabant/vim-gutentags'
Plug 'romainl/vim-qf'
Plug 'romainl/vim-qlist'

" Essentials
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-visual-star-search'

Plug 'rizzatti/dash.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'

" Python
Plug 'davidhalter/jedi-vim', {'for': ['python']}
Plug 'zchee/deoplete-jedi', {'for': ['python']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/python_match.vim'
" PHP & Wordpress
" Plug 'shawncplus/phpcomplete.vim', {'for': [ 'php','html','php.wordpress' ]}
" Plug 'captbaritone/better-indent-support-for-php-with-html'
" Plug 'dsawardekar/wordpress.vim'

" Frontend
Plug 'mattn/emmet-vim', { 'for': ['css', 'html', 'htmldjango', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
call plug#end()
" }}}

set background=dark
colorscheme gruvbox

" Netrw {{{
let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
" let g:netrw_browse_split = 4
" let g:netrw_winsize = -28
" let g:netrw_liststyle = 3
" }}}

if has('nvim')
  call deoplete#enable()
endif

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


