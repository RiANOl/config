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
set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bitc/vim-bad-whitespace'
Plug 'obreitwi/vim-sort-folds'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }

Plug 'gorodinskiy/vim-coloresque'

Plug 'chrisbra/csv.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-ruby/vim-ruby'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'

if v:version > 704 || (v:version == 704 && has( 'patch1578' ))
    if has( 'python' ) || has( 'python3' )
        Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
    endif
endif

call plug#end()

augroup vimrc
    autocmd!
    autocmd FileType go setlocal shiftwidth=8 softtabstop=2 noexpandtab
augroup END

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

colorscheme solarized

let NERDTreeShowHidden=1

map <C-g> :GitGutterToggle<CR>
map <C-t> :NERDTreeToggle<CR>
