syntax on

set background=dark
set smarttab
set autoindent
set mouse=a
set nobackup
set nomodeline
set linebreak
set noswapfile
set number
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set smarttab
set softtabstop=2
set undodir=~/.vim/undo//
set undofile
set clipboard=unnamedplus
set autochdir

let mapleader = ' '

nnoremap <leader><leader> :w<cr>
nnoremap <leader>q :q<cr>

vnoremap <leader>y :w pbcopy<cr>
vmap s S

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
inoremap <c-t> <esc>hxpa
