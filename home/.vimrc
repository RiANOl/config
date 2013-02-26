set colorcolumn=120
set cursorline
set nocompatible
set display=lastline
set hlsearch
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
set shiftwidth=2
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

let g:solarized_termcolors=256
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_wildcard=0

filetype plugin indent on
syntax enable

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme solarized

if has('gui_running')
  set guifont=Monaco:h14
  set columns=130
endif
