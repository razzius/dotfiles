syntax on
set autochdir
set autoindent
set autoindent
set background=dark
set clipboard=unnamed
set linebreak
set incsearch
set ignorecase
set mouse=a
set nobackup
set nomodeline
set noswapfile
set number
set shiftwidth=2
set shortmess+=I
set showcmd
set smartcase
set smarttab
set undodir=~/.vim/undo//
set undofile

" Do not comment when opening lines after comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" automaticaly set indent for filetype
filetype plugin indent on

let mapleader = ' '

nnoremap <leader><leader> :w<cr>
nnoremap <leader>q :q<cr>

vnoremap <leader>y :w pbcopy<cr>
vmap s S

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
inoremap <c-t> <esc>hxpa
