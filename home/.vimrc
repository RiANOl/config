set colorcolumn=120
set cursorline
set nocompatible
set display=lastline
set hlsearch
set lazyredraw
set laststatus=2
set nolinebreak
set number
set ruler
set secure
set showcmd
set noshowmatch
set showmode
set tabpagemax=20
set novisualbell
set wrap
set wrapscan

set autoindent
set nocindent
set smartindent

set backspace=indent,start
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=8

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,shift-jis,euc-jp,big5,gb18030,utf-16,utf-16le,utf-16be
set termencoding=utf-8

set fileformat=unix
set fileformats=unix,dos,mac

set background=dark
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bitc/vim-bad-whitespace'
Plug 'obreitwi/vim-sort-folds'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'junegunn/gv.vim', { 'on': 'GV' }

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'chrisbra/csv.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

augroup vimrc
    autocmd!
    autocmd FileType go setlocal shiftwidth=8 softtabstop=2 noexpandtab
augroup END

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

let g:Hexokinase_highlighters = ['backgroundfull']

let NERDTreeShowHidden=1

map <C-g> :GitGutterToggle<CR>
map <C-t> :NERDTreeToggle<CR>
