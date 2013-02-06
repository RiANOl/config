set nocompatible
set number
set ruler
set secure
set novisualbell

set showcmd
set noshowmatch
set showmode

set display=lastline
set hlsearch
set wrapscan

set noautoindent
set nocindent
set smartindent

set backspace=indent,start
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=8
set tabstop=8

if version >= 703
  set colorcolumn=120
endif
set nolinebreak
set wrap

set tabpagemax=20

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,shift-jis,euc-jp,big5,gb18030,utf-16,utf-16le,utf-16be
set termencoding=utf-8

set fileformat=unix
set fileformats=unix,dos,mac

set viminfo='100,<1000,s100

set t_Co=256

filetype plugin indent on

syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

if !filereadable(expand('<sfile>:p:h') . '/.vim/bundle/YouCompleteMe/python/ycm_core.so')
  let g:pathogen_disabled = ['YouCompleteMe']
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme solarized
