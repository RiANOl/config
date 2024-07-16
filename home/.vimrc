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

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ntpeters/vim-better-whitespace'

if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

call plug#end()

let g:gruvbox_contrast_dark='hard'

colorscheme gruvbox

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

if has('nvim')
    lua require('config/treesitter')
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable
    hi link @text.diff.add diffAdded
    hi link @text.diff.delete diffRemoved

    let g:coc_global_extensions = [
                \ 'coc-css',
                \ 'coc-go',
                \ 'coc-highlight',
                \ 'coc-html',
                \ 'coc-html-css-support',
                \ 'coc-json',
                \ 'coc-markdownlint',
                \ 'coc-yaml',
                \ ]
    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
    inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
                \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif
