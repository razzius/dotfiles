syntax on
filetype plugin indent on

if !empty($VIM_TERMINAL)
  echom "Vim is nested in vim terminal, you don't want this"
endif

highlight Search cterm=NONE ctermfg=grey ctermbg=blue

let mapleader = ' '
set autoindent
set clipboard=unnamedplus
set expandtab
set foldlevelstart=99
set foldmethod=syntax
set gdefault

" Allows hidden buffers
set hidden

set hlsearch
set ignorecase
set incsearch
set linebreak
set mouse=a
set undofile

" Disable swap files, editors crashing doesn't lose much data
set noswapfile

set shiftwidth=2
set smartcase
set smartindent
set smarttab
set splitbelow
set splitright
set tabstop=2

noremap <C-@><C-@> <C-w><C-w>
noremap <C-@><leader> <C-w><C-w>
nnoremap <C-@><Tab> gt
nnoremap <Tab> gt
nnoremap <C-@><S-Tab> gT
noremap <C-@>h <C-w>h
noremap <C-@>j <C-w>j
noremap <C-@>k <C-w>k
noremap <C-@>l <C-w>l

inoremap <C-]> <C-q><TAB>
inoremap <C-k> <C-o>D
inoremap <C-l> <C-x><C-l>
inoremap <C-t> <esc>hxpa

nnoremap ^ 0
nnoremap 0 ^
nnoremap <C-c> ZZ<cr> " This helps in nested vim situations
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-@>c :tab ter<cr>
nnoremap <C-@>' :terminal<cr>
" nnoremap <C-@>" :terminal<cr>
nnoremap <C-@>% :vert terminal<cr>
nnoremap <C-@><space> <c-w><c-p>
nnoremap <C-@>c :tab ter<cr>
nnoremap <C-@>h <C-w>h
nnoremap <C-@>l <C-w>l
nnoremap - ddp
nnoremap gm gM
nnoremap gM gm
nnoremap j gj
nnoremap k gk
nnoremap <leader>, A,<esc>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>h :help<space>
nnoremap <leader><leader> :w<cr>

" TODO messes up when used on commented line (try it on this one :)
nnoremap [<leader> O<ESC>j
nnoremap ]<leader> o<ESC>k
nnoremap <leader>o o<esc>P
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <leader><return> :nohlsearch<cr>
nnoremap <leader>r :source $MYVIMRC <bar> :echom "RELOAD"<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>" :terminal<cr>
nnoremap <leader>' :terminal<cr>
nnoremap <leader>v <C-v>
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader>w <C-w>
nnoremap _ :m .-2<cr>
nnoremap q<leader> :q<cr>
nnoremap <silent> <leader><esc> :bprevious<cr>:bdelete #<cr>
nnoremap <silent> <leader>fr :browse oldfiles<cr>
nnoremap <esc>v <C-@>"+

tnoremap <C-@>% <C-@>:vert terminal<cr>
tnoremap <C-@>' <C-@>:terminal<cr>

" shouldn't really use this, but muscle memory
tnoremap <C-@>" <C-@>:terminal<cr>

noremap <C-@>r <C-@>:source $MYVIMRC <bar> :echom "RELOAD"<cr>
noremap <C-@>v <C-@>:tabe $MYVIMRC<cr>

tnoremap <C-@><C-i> <C-@>gt
tnoremap <C-@>[ <C-@>N
tnoremap <C-@>c <C-@>:tab terminal<cr>
tnoremap <C-[> <C-@>N
tnoremap <esc>v <C-@>"+

" TODO implement tab stack
tnoremap <C-@><space> <C-@>:tabnext<cr>
nnoremap <C-@><space> <C-@>:tabnext<cr> " TODO implement tab stack

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

" c-tab isn't recognized by terminal,
" need to remap this using os hotkeys first
" noremap <C-@><C-i> <C-@>gt
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
      \ '' : getcmdline()[:getcmdpos()-2]<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" feature idea: allow writing "readonly files" after having some visual indication that the file is readonly

nnoremap <leader>b :only <bar> :below terminal python3 %<cr><C-w><C-w>


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

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

let g:lsp_document_highlight_enabled = 0

if has('nvim')
  autocmd TermOpen * startinsert
  let undofolder = '$HOME' . '.config/nvim/undo'
  if !isdirectory(undofolder)
    call mkdir(undofolder, "p", 0700)
  endif
  set undodir=~/.config/nvim/undo
endif

if !has('nvim')
  set termwinkey=<C-@>
  set autoshelldir

  if !isdirectory($HOME . "/.vim/undo")
    call mkdir($HOME . "/.vim/undo", "p", 0700)
  endif
  set undodir=~/.vim/undo
endif

function Tapi_TabEdit(bufnum, arglist)
  execute 'tabedit' a:arglist[0]
endfunc

function Tapi_TerminalEdit(bufnum, arglist)
  execute 'edit' a:arglist[0]
endfunc
