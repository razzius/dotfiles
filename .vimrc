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
set fixendofline
set hlsearch
set ignorecase
set incsearch
set linebreak
set list
set listchars=tab:⇥·
set mouse=a
set nobackup
set nomodeline
set noswapfile
set number
set ruler
set shiftwidth=2
set shortmess+=IT
set showcmd
set smartcase
set smarttab
set undodir=~/.vim/undo//
set undofile
set updatetime=100
set viminfo='25
set wildmode=list:full

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
  autocmd BufWritePost $MYVIMRC source %
  autocmd InsertEnter * hi link EndOfLineSpace Normal
  autocmd InsertLeave * hi link EndOfLineSpace ErrorMsg
augroup END

" Do not comment when opening lines after comment
autocmd! BufNewFile,BufRead * setlocal formatoptions-=cro

let mapleader = ' '

cnoremap <C-a> <HOME>
inoremap <C-]> <C-q><TAB>
inoremap <C-i> <C-x><C-l>
inoremap <C-t> <esc>hxpa
nnoremap - ddp
nnoremap 0 ^
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>" :belowright terminal<cr>
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader>' :belowright terminal<cr>
nnoremap <leader><leader> :w<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>h :help<space>
nnoremap <silent> <leader>fr :browse oldfiles<cr>
nnoremap <leader>o :q<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w <C-w>
nnoremap <silent> <leader><esc> :bdelete<cr>
nnoremap <leader>r :source $MYVIMRC <bar> :echo "RELOAD"<cr>
nnoremap ^ 0
nnoremap _ :m .-2<CR>
nnoremap j gj
nnoremap gm gM
nnoremap gM gm
nnoremap k gk
nnoremap ]<leader> o<ESC>k
nnoremap [<leader> O<ESC>j
nnoremap <cr> :nohlsearch<cr>
tnoremap <C-[> <C-w>N
vmap s S
vnoremap ! !sort<cr>
vnoremap $ $h
vnoremap <leader>y :w pbcopy<cr>

let g:NERDCreateDefaultMappings = 1
