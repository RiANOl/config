if v:version >= 703
  set colorcolumn=120
endif

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
set softtabstop=8
set tabstop=8

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,shift-jis,euc-jp,big5,gb18030,utf-16,utf-16le,utf-16be
set termencoding=utf-8

set fileformat=unix
set fileformats=unix,dos,mac

set background=dark
set t_Co=256

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'bitc/vim-bad-whitespace'

Bundle 'bling/vim-airline'

Bundle 'kien/ctrlp.vim'

Bundle 'ap/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'

Bundle 'othree/vim-javascript-syntax'
Bundle 'othree/javascript-libraries-syntax.vim'

Bundle 'othree/html5.vim'

Bundle 'tpope/vim-haml'

Bundle 'tpope/vim-rails'

Bundle 'saltstack/salt-vim'

if (v:version == 703 && has('patch584')) || v:version > 703
  Bundle 'Valloric/YouCompleteMe'
endif

filetype plugin indent on
syntax enable

let g:airline#extensions#tabline#enabled=1

let g:indentLine_color_term=239

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

colorscheme solarized
