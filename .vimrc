" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General Override of Defaults
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set ttyfast
set showmode
set showcmd
set title
set number
set hidden

" This is what files look like
set ffs=unix,dos,mac

" Update find path to search subdirectories
set path=$PWD/**

" No backups
"set nobackup
"set nowritebackup
"set nowb
"set noswapfile

" Keep lots of history/undo
set undolevels=1000

" Files to ignore
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Erlang
set wildignore+=*.beam
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar

" Remap escape on macbooks with no escape key
"inoremap jk <Esc>

" Set paste toggle
set pastetoggle=<F3>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Installation
"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Set up Vundle on first install - Vundle, in turn, installs all other plugins
set exrc
set secure

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" List bundles here
" ~~~~~~~~~~~~~~~~~

" General
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
" PaperColor
Plugin 'NLKNguyen/papercolor-theme'
" JavaScript
Plugin 'jelera/vim-javascript-syntax'
" CSS and SCSS
Plugin 'cakebaker/scss-syntax.vim'
" Asynchronous Lint Engine
Plugin 'dense-analysis/ale'
" Lightline Bar
Plugin 'itchyny/lightline.vim'
" Nerdtree
Plugin 'preservim/nerdtree'
" Nerdtree git
Plugin 'Xuyuanp/nerdtree-git-plugin'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" end of vundle setup

" Toggle Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Colorscheme
set t_Co=256
set background=dark
colorscheme PaperColor

set colorcolumn=80,100

" Workaround for bug that effects kitty and background color erase
let &t_ut=''

"lightline config
let g:lightline = {
      "\ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Set split to below
set splitbelow

" Tab sanity
set expandtab
set tabstop=4
set shiftwidth=4

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ALE Configuration
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['black', 'isort'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_linters = {
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['flake8'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\   'terraform': ['tflint'],
\}
let g:ale_fix_on_save = 1
