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

" Vim-Plug {{{
call plug#begin('~/.config/nvim/plugged')
if !has('nvim')
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'bronson/vim-visual-star-search'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/targets.vim'
Plug 'tomtom/tcomment_vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

" NCM 2
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-ultisnips'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-tagprefix'
" Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
" Plug 'ncm2/ncm2-html-subscope'
" Plug 'ncm2/ncm2-abbrfuzzy'
" Plug 'ncm2/ncm2-cssomni'
" autocmd BufEnter * call ncm2#enable_for_buffer()

Plug 'neoclide/coc.nvim', {'tag': '*'}

Plug 'majutsushi/tagbar'


Plug 'mattn/emmet-vim', { 'for': ['less', 'scss', 'css', 'html.php', 'html', 'htmldjango', 'jinja.html', 'jinja', 'jinja2', 'twig', 'javascript.jsx', 'php', 'vue'] }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'

Plug 'itchyny/lightline.vim'

Plug 'akiyan/vim-textobj-php'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'posva/vim-vue'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vifm/vifm.vim'
Plug 'godlygeek/tabular'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'leafgarland/typescript-vim'
" Plug 'semanticart/tag-peek.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'brooth/far.vim'
Plug 'norcalli/nvim-colorizer.lua'
" Plug 'andymass/vim-matchup'
" Plug 'kizza/actionmenu.nvim'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'taigacute/gruvbox9'
Plug 'Yggdroot/indentLine'
Plug 'heavenshell/vim-jsdoc'
Plug 'arcticicestudio/nord-vim'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf'
Plug 'elzr/vim-json', { 'for': ['json'] }
call plug#end()
" }}}

" Colorscheme
set background=dark
" let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_transp_bg = 1
let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_italicize_strings = 0
let g:gruvbox_plugin_hi_groups = 1
" colorscheme gruvbox
colorscheme gruvbox9_hard
" colorscheme tender

" Plugin config
let g:netrw_list_hide='.git,*.pyc,.DS_Store,__pycache__'
let g:netrw_winsize = -28
let g:netrw_liststyle = 3
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]
let g:markdown_fenced_languages = ['html', 'vim', 'ruby', 'python', 'bash=sh', 'javascript']
let g:AutoPairsMultilineClose = 0
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:javascript_plugin_jsdoc = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_underscore_private = 1

" let /:matchup_matchparen_deferred = 1

let g:ale_enabled = 0 
let g:UltsSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'

let g:vue_pre_processors = ['sass', 'scss']

" ctagsargs taken from tagbar.vim and modified to support roles.
let g:tagbar_type_vue = {
  \'ctagsbin': '/usr/local/bin/ctags',
  \'ctagstype': 'JavaScript',
  \'kinds': [
  \ 'f:functions',
  \ 'm:methods',
  \ 'c:constants:1',
  \ 'v:global variables',
  \ 'g:generators',
  \ 'G:getters',
  \ 'S:setters'
  \],
  \'sro': '.'
\}

" (Re)maps
noremap Q @q
nnoremap <leader>ev :e $MYVIMRC<cr>
map <leader>c <c-_><c-_>
inoremap jj <esc>
inoremap <C-U> <C-G>u<C-U>
nnoremap <silent> <leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
" noremap <C-p> :Files<cr>
nnoremap <silent> <leader><leader> :Files<cr>
nnoremap <leader>o :Buffers<CR>
nnoremap <leader>q :call tag_peek#ShowTag()<CR>
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

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>[ :ccl<cr>
nmap <silent> <leader>d :JsDoc<cr>

nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>h :TagbarToggle<CR>
nnoremap <leader>z :ccl<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>
command! Reveal :silent exec "!open -R %"

command! ProfileStart :call functions#StartProfile()
command! ProfileEnd :call functions#EndProfile()

" Custom AutoCmds {{{
augroup vimrcEx
  autocmd!

  " Strip trailing whitespace on save
  autocmd FileType python,php,vue,javascript,html autocmd BufWritePre <buffer> %s/\s\+$//e

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
" augroup customHighlights
"   autocmd!
"   if !has('gui') && !has('gui_vimr')
" "     hi Normal guibg=NONE ctermbg=NONE
" "     hi SignColumn guibg=NONE ctermbg=NONE
"     hi ActiveWindow guibg=#1D2021
"     hi InactiveWindow guibg=#282828
"     set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
"   endif
" augroup END


let s:code_actions = []
let g:vim_json_syntax_conceal = 0

func! ActionMenuCodeActions() abort
  let s:code_actions = CocAction('codeActions')
  let l:menu_items = map(copy(s:code_actions), { index, item -> item['title'] })
  call actionmenu#open(l:menu_items, 'ActionMenuCodeActionsCallback')
endfunc

func! ActionMenuCodeActionsCallback(index, item) abort
  if a:index >= 0
    let l:selected_code_action = s:code_actions[a:index]
    let l:response = CocAction('doCodeAction', l:selected_code_action)
  endif
endfunc

" Project specific override {{{
let s:vimrc_project = $PWD . '/.local.vim'
if filereadable(s:vimrc_project)
  execute 'source ' . s:vimrc_project
endif
" }}}

function! LightlineFilename()
  return &filetype ==# 'fzf' ? 'FZF' :
        \ expand('%:F') !=# '' ? expand('%:F') : '[No Name]'
endfunction

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ 'colorscheme': 'gruvbox9'
      \ }
" Other files {{{
" plugin/autosession.vim  " Auto-Session Plugin
" after/plugin            " Plugin Settings
" autoload/functions.vim  " Functions
" ftplugin                " File-type plugins
" ftdetect                " File-type detect
" UltiSnips               " Snippets
" }}}

" vim: fdm=marker:path=~/.config/nvim/**
