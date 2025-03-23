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

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

autocmd FileType terraform setlocal shiftwidth=2

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ntpeters/vim-better-whitespace'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'Exafunction/codeium.nvim'

    Plug 'onsails/lspkind.nvim'

    Plug 'ellisonleao/gruvbox.nvim'
else
    Plug 'morhetz/gruvbox'
endif

call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

if has('nvim')
    lua require('config/treesitter')
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable

    lua require('config/cmp')

    lua require('config/codeium')

    lua require('config/gruvbox')
else
    let g:gruvbox_contrast_dark='hard'
endif

colorscheme gruvbox
