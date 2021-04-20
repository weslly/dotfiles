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

if has('gui')
  set guifont=mononokiNerdFontComplete-Regular:h13
endif

set laststatus=2
set statusline=%<\ %f\ %m%r%w%=%y\ \ %l,%-3c\ %p%%\ "

set clipboard=unnamed
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
set scroll=5 " number of lines to scroll with ctrl-d/u
set synmaxcol=1500
set shortmess+=c
set pumheight=10 " autocomplete max height
set lazyredraw
set laststatus=2
set splitbelow
set splitright
" set autoindent
set shiftwidth=2
set expandtab
set shiftround
set smarttab
set incsearch
set hlsearch
set ignorecase
set smartcase
set mouse=a

set path+=**
set wildignore+=*.map,yarn.lock,package-lock.json,*.swp,*.bak,*.pyc,*.min.*,bundle.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/vendor/*,*/dist/*,*/node_modules/*,*/bower_components/*
set wildignore+=tags,cscope.*

set undofile
set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes
" set nocursorline
set cursorline

set undodir=/tmp/
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap,/tmp/

if exists('&inccommand')
  set inccommand=split
endif

if executable('rg')
  set grepprg=rg\ -H\ -S\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

if has('folding')
  set foldmethod=indent
  set nofoldenable
  set foldlevelstart=999
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
" }}}

let g:mapleader= ' '

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

let g:ale_disable_lsp = 1 

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " after/plugin/fzf.vim
Plug 'kana/vim-textobj-user'
Plug 'akiyan/vim-textobj-php'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-visual-star-search'
Plug 'editorconfig/editorconfig-vim' " after/plugin/editorconfig.vim
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'

Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'leafgarland/typescript-vim'
Plug 'keith/swift.vim'

Plug 'rhysd/git-messenger.vim'
" Plug 'lifepillar/vim-gruvbox8'
Plug 'SirVer/ultisnips' " after/plugin/UltiSnips.vim
" Plug 'udalov/kotlin-vim'
Plug 'honza/vim-snippets'
" Plug 'vifm/vifm.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " after/plugin/coc.vim
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale' " after/plugin/ale.vim
Plug 'AndrewRadev/switch.vim'
Plug 'mattn/emmet-vim', { 'for': ['less', 'scss', 'css', 'html.php', 'html', 'htmldjango', 'jinja.html', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php', 'vue'] }
Plug 'itchyny/lightline.vim' " after/plugin/lightline.vim
" Plug 'maximbaz/lightline-ale'
" Plug 'josa42/vim-lightline-coc'
Plug 'KabbAmine/vCoolor.vim' " after/plugin/vcoolor.vim
" Plug 'Yggdroot/indentLine'
" Plug 'airblade/vim-gitgutter' " after/plugin/gitgutter.vim
" Plug 'brooth/far.vim'
Plug 'morhetz/gruvbox'
" Plug 'ayu-theme/ayu-vim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\} " after/plugin/jsdoc.vim
Plug 'semanticart/tag-peek.vim'
" Plug 'jesseleite/vim-agriculture'
" Plug 'godlygeek/tabular'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'andymass/vim-matchup'
" Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
" Plug 'preservim/tagbar'
Plug 'liuchengxu/vista.vim'

" Plug 'glepnir/spaceline.vim'
" " Use the icon plugin for better behavior
" Plug 'kyazdani42/nvim-web-devicons'
" if !has('nvim')
"   Plug 'ryanoasis/vim-devicons' 
" endif
call plug#end()
" }}}

" Colorscheme
" Gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italicize_strings = 0
let g:gruvbox_plugin_hi_groups = 1
colorscheme gruvbox

let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

let g:vista_executive_for = {
  \ 'js': 'coc',
  \ 'ts': 'coc',
  \ }

let g:vista_default_executive = 'coc'
let g:vista_ignore_kinds = ['Variable', 'Property', 'Function']

" Plugin config
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:vimwiki_hl_cb_checked = 1
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'javascript']
let g:AutoPairsMultilineClose = 0
let g:AutoPairsMapSpace = 0
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:vue_pre_processors = ['sass', 'scss']

" (Re)maps
noremap Q @q
nnoremap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
inoremap jj <esc>
inoremap <C-U> <C-G>u<C-U>
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <silent> <leader><leader> :Files<cr>
nnoremap <leader>o :Buffers<CR>
" nnoremap <leader>q :call tag_peek#ShowTag()<CR>
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

vnoremap <leader>g y:grep "<c-r>"" <CR>
nnoremap <leader>q :call tag_peek#ShowTag()<CR>

vnoremap <silent> <leader>\ :VCoolor<CR>
nnoremap <silent> <leader>\ :VCoolor<CR>

nmap <silent> <leader>[ :ccl<cr>

nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>z :ccl<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
command! Reveal :silent exec "!open -R %"

command! ProfileStart :call functions#StartProfile()
command! ProfileEnd :call functions#EndProfile()

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!

  " Strip trailing whitespace on save
  autocmd FileType python,php,vue,javascript,html,css autocmd BufWritePre <buffer> %s/\s\+$//e

  " Automatically equalize splits when Vim is resized
  autocmd VimResized * wincmd =

  " See :h last-position-jump
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif

  " Auto reload vimrc on save
  " autocmd BufWritePost $MYVIMRC,~/.vimrc nested silent source $MYVIMRC
  autocmd BufWritePost *.vim nested silent source %

  " automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost    l* lwindow

  " I keep forgetting I can't close :help with `q`
  autocmd FileType help map <buffer> q :close<cr>

  autocmd FileType vue syntax sync fromstart

  " lua require'colorizer'.setup()
augroup END

" Change background color for active window
augroup customHighlights
  autocmd!
  if !has('gui') && !has('gui_vimr')
    hi Normal guibg=NONE ctermbg=NONE
" "     hi SignColumn guibg=NONE ctermbg=NONE
"     hi ActiveWindow guibg=#1D2021
"     hi InactiveWindow guibg=#282828
"     set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
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
