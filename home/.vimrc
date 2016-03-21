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

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'bitc/vim-bad-whitespace'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

Plugin 'gorodinskiy/vim-coloresque'
Plugin 'hail2u/vim-css3-syntax'

Plugin 'othree/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'othree/html5.vim'

Plugin 'tpope/vim-haml'

Plugin 'tpope/vim-rails'

Plugin 'saltstack/salt-vim'

Plugin 'Glench/Vim-Jinja2-Syntax'

Plugin 'puppetlabs/puppet', {'rtp': 'ext/vim/'}

let s:load_ycm_only_host_path = $HOME . '/.load_ycm_only_host.vim'
if filereadable(s:load_ycm_only_host_path)
    exec 'source ' . s:load_ycm_only_host_path
endif

if (v:version == 703 && has('patch584')) || v:version > 703
    if !exists('g:load_ycm_only_host') || g:load_ycm_only_host == substitute(system('hostname'), '\n', '', '')
        Plugin 'Valloric/YouCompleteMe'
    endif
endif

call vundle#end()

filetype plugin indent on
syntax enable

augroup vimrc
    autocmd!
    autocmd FileType puppet setlocal sw=2 sts=2
augroup END

let g:airline#extensions#tabline#enabled=1

let g:indentLine_color_term=239

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

colorscheme solarized
