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

filetype off

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bitc/vim-bad-whitespace'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }

Plug 'gorodinskiy/vim-coloresque'

Plug 'chrisbra/csv.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'rodjek/vim-puppet'
Plug 'stephpy/vim-yaml'

if v:version > 704 || (v:version == 704 && has( 'patch1578' ))
    let s:load_ycm_only_host_path = $HOME . '/.load_ycm_only_host.vim'
    if filereadable(s:load_ycm_only_host_path)
        exec 'source ' . s:load_ycm_only_host_path
    endif

    if !exists('g:load_ycm_only_host') || g:load_ycm_only_host == substitute(system('hostname'), '\n', '', '')
        function! BuildYCM(info)
            if a:info.status == 'installed' || a:info.force
                !./install.py
            endif
        endfunction
        Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    endif
endif

call plug#end()

augroup vimrc
    autocmd!
    autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2
    autocmd FileType puppet setlocal shiftwidth=2 softtabstop=2
    autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
augroup END

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1

let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0

colorscheme solarized

map <C-g> :GitGutterToggle<CR>
map <C-n> :NERDTreeToggle<CR>
