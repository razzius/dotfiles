filetype plugin indent on

hi Search cterm=NONE ctermfg=grey ctermbg=blue

let mapleader = ' '
set clipboard=unnamedplus
set expandtab
set hlsearch
set ignorecase
set incsearch
set shiftwidth=2
set smartcase
set tabstop=2
set linebreak
set termwinkey=<C-@>
set splitright
set splitbelow
set foldmethod=syntax
set foldlevelstart=99

" c-tab isn't recognized by terminal,
" need to remap this using os hotkeys first
" nnoremap <C-tab> :tabn<cr>
cnoremap <C-a> <HOME>
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
cnoremap <C-k> <Left>
cnoremap <C-t> <C-f>$Xp<C-c><right><C-l>
cnoremap <C-up> <C-f>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
inoremap <C-]> <C-q><TAB>
inoremap <C-k> <C-o>D
inoremap <C-l> <C-x><C-l>
inoremap <C-t> <esc>hxpa
nnoremap ^ 0
nnoremap 0 ^
nnoremap <C-c> ZZ<cr> " This helps in nested vim situations
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" nnoremap <cr> :nohlsearch<cr>
nnoremap - ddp
nnoremap gm gM
nnoremap gM gm
nnoremap j gj
nnoremap k gk
nnoremap <C-@><C-@> <C-w><C-w>
nnoremap <C-@><leader> <C-w><C-w>
nnoremap <C-@>c :tab ter<cr>
nnoremap <C-@>l <C-w>l
nnoremap <C-@>h <C-w>h
nnoremap <leader>, A,<esc>
nnoremap <leader>" :terminal<cr>
nnoremap <leader>' :terminal<cr>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>h :help<space>
nnoremap <leader>ih :call TrimWhitespace()<cr>Go<cr>###<space>
nnoremap <leader><leader> :w<cr>
nnoremap [<leader> O<ESC>j
nnoremap ]<leader> o<ESC>k
nnoremap <leader>o o<esc>P
nnoremap <leader>q :q<cr>
nnoremap <leader><esc> :bprevious<CR>:bdelete #<CR>
nnoremap q<leader> :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader>r :source $MYVIMRC <bar> :echom "RELOAD"<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>v <C-v>
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader>w <C-w>
nnoremap _ :m .-2<CR>
nnoremap <silent> <leader><esc> :bdelete<cr>
nnoremap <silent> <leader>fr :browse oldfiles<cr>
tnoremap <C-[> <C-w>N
tnoremap <C-@><space> <C-w><C-w>
vmap s S
vnoremap $ $h
vnoremap ^ 0
vnoremap 0 ^
vnoremap <leader>y :w pbcopy<cr>
vnoremap ! !sort<cr>

" scroll up/down in the other window
" only works if you have 2 windows
nmap <c-j> <c-w>w<c-e><c-w>w
nmap <c-k> <c-w>w<c-y><c-w>w

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" allow writing "readonly files" after having some visual indication that the file is readonly

nnoremap <leader>b :only <bar> :below terminal python3 %<cr><C-w><C-w>


if !isdirectory($HOME . "/.vim/undo")
    call mkdir($HOME . "/.vim/undo", "p", 0700)
endif
set undodir=~/.vim/undo
set undofile

function! ConfigCamelCase()
    if &rtp =~ 'CamelCaseMotion'
        map <silent> w <Plug>CamelCaseMotion_w
        map <silent> b <Plug>CamelCaseMotion_b
        map <silent> e <Plug>CamelCaseMotion_e
        map <silent> ge <Plug>CamelCaseMotion_ge
        sunmap w
        sunmap b
        sunmap e
        sunmap ge
    endif
endfunction

autocmd VimEnter * call ConfigCamelCase()

