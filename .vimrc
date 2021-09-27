syntax on
" automaticaly set indent for filetype
filetype plugin indent on

set autochdir
set autoindent
set background=dark

" Allow backspacing over start of line
set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set ignorecase
set incsearch
set fixendofline
set linebreak
set listchars=tab:⇥·
set list
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

function TrimWhitespace()
    let save_cursor = getpos(".")
    silent! %s/\s\+$//e
    silent! %s/$\n\+\%$//e
    call setpos('.', save_cursor)
endfunction

highlight default link EndOfLineSpace ErrorMsg
match EndOfLineSpace / \+$/

augroup nicetohaves
  autocmd!
  autocmd BufWritePre * call TrimWhitespace()
  autocmd InsertEnter * hi link EndOfLineSpace Normal
  autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg
augroup END

" Do not comment when opening lines after comment
autocmd! BufNewFile,BufRead * setlocal formatoptions-=cro

let mapleader = ' '

cnoremap <C-a> <HOME>
inoremap <C-i> <C-q><TAB>
inoremap <C-t> <esc>hxpa
nnoremap - ddp
nnoremap 0 ^
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader><leader> :w<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>w <C-w>
nnoremap ^ 0
nnoremap _ :m .-2<CR>
nnoremap j gj
nnoremap k gk
tnoremap <C-[> <C-w>N
vmap s S
vnoremap ! !sort<cr>
vnoremap <leader>y :w pbcopy<cr>

let g:NERDCreateDefaultMappings = 1
