set showmode

set shell=/usr/local/bin/zsh      " use zsh as default shell
set clipboard=unnamed   " use system clipboard
set hidden

set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround

set cursorline
set ignorecase
set smartcase
set foldenable
set mouse=a
set splitbelow
set splitright

set virtualedit=block

if !exists('g:actualvim')
  set scrolljump=5
  set timeoutlen=500
  " set lazyredraw
  set showmatch
  set number
endif

if exists('&inccommand')
  set inccommand=split
endif

