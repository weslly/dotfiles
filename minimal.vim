filetype on
filetype plugin indent on
syntax enable

if has('nvim')
  set timeoutlen=500
else
  set ttimeout
  set ttimeoutlen=100
endif

if exists('&termguicolors')
  set termguicolors
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
set autoread
set cursorline
set splitbelow
set splitright
set autoindent
set shiftwidth=4
set expandtab
set shiftround
set smarttab
set scrolloff=1
set sidescrolloff=5
set scrolljump=5
set incsearch
set hlsearch
set ignorecase
set smartcase

if exists('&inccommand')
  set inccommand=split
endif

set path+=**
set wildignore+=*.swp,*.bak
set wildignore+=*.pyc,*.min.*,bundle.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=tags,cscope.*
set wildignore+=*.tar.*

set noundofile
set nobackup
set noswapfile

let g:mapleader= ' '

cnoremap %% <C-R>=expand('%:h').'/'<cr>
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

