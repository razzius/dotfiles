syntax on
set autochdir
set autoindent
set background=dark
" Allow backspacing over start of line
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
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
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>w <C-w>
nnoremap 0 ^
nnoremap ^ 0
nnoremap j gj
nnoremap k gk

vnoremap <leader>y :w pbcopy<cr>
vmap s S

nnoremap - ddp
nnoremap _ :m .-2<CR>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
inoremap <C-t> <esc>hxpa
tnoremap <C-[> <C-w>N
