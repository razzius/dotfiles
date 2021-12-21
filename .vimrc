syntax on

" From https://stevelosh.com/projects/badwolf
" To install it, run git clone https://github.com/sjl/badwolf ~/.vim/pack/vendor/start/badwolf
colorscheme badwolf

" automaticaly set indent for filetype
filetype plugin indent on

set autochdir
set autoindent
set autoread
set background=dark
" Allow backspacing over start of line
set backspace=indent,eol,start
set clipboard=unnamed
set gdefault
set expandtab
set fixendofline
set hlsearch
set ignorecase
set incsearch
set linebreak
set list
set listchars=tab:⇥\ ,nbsp:·
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

" Used to be ~/.vim/undo, but that breaks silently if that folder is missing.
" Just throw it in ~/.vim.
set undodir=~/.vim/
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
highlight SpecialKey guifg=darkgrey ctermfg=darkgrey
" TODO want # and " to highlight differently in vim
" I keep typing # to mean comment...
" highlight PoundKey guifg=darkgrey ctermfg=darkgrey
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

" Don't show warning when using w!! to write readonly file
autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None

let mapleader = ' '

cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>
cnoremap <C-a> <HOME>
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
cnoremap <C-k> <Left>
cnoremap <C-t> <C-f>$Xp<C-c><right><C-l>
cnoremap <C-up> <C-f>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
inoremap <C-]> <C-q><TAB>
inoremap <C-l> <C-x><C-l>
inoremap <C-k> <C-o>D
inoremap <C-t> <esc>hxpa
nnoremap - ddp
nnoremap 0 ^
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <cr> :nohlsearch<cr>
nnoremap <leader>" :belowright terminal<cr>
nnoremap <leader>% :vertical terminal<cr>
nnoremap <leader>' :belowright terminal<cr>
nnoremap <leader><leader> :w<cr>
nnoremap <leader><tab> :e #<cr>
nnoremap <leader>fi :e ~/.vimrc<cr>
nnoremap <leader>h :help<space>
nnoremap <leader>ih :call TrimWhitespace()<cr>Go<cr>###<space>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
nnoremap <C-c> ZZ<cr> " This helps in nested vim situations
nnoremap <leader>r :source $MYVIMRC <bar> :echom "RELOAD"<cr>
nnoremap <leader>v <C-v>
nnoremap <leader>w <C-w>
nnoremap <silent> <leader><esc> :bdelete<cr>
nnoremap <silent> <leader>fr :browse oldfiles<cr>
nnoremap [<leader> O<ESC>j
nnoremap ]<leader> o<ESC>k
nnoremap <leader>, A,<esc>
nnoremap ^ 0
nnoremap _ :m .-2<CR>
nnoremap gM gm
nnoremap gm gM
nnoremap j gj
nnoremap k gk
tnoremap <C-[> <C-w>N
vmap s S
vnoremap ! !sort<cr>
vnoremap $ $h
vnoremap <leader>y :w pbcopy<cr>
vnoremap ^ 0
vnoremap 0 ^
vmap s S
nnoremap <leader>o o<esc>P

set ttimeout
set ttimeoutlen=1
set ttyfast

" blinking block in insert mode
let &t_EI = "\e[2 q"
let &t_SI = "\<esc>[1 q"

function! DescribeKey()
  try
    let char = getcharstr()
  catch /^Vim:Interrupt$/
    echo "oops int"
    return
  endtry
  let charmod = getcharmod()
  echom "you pres" . char . charmod
endfunction

nnoremap <silent> <C-h>k :call DescribeKey()<cr>

" Config for https://github.com/bkad/CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" disable q: keybinding for command line, too close to :q
nnoremap q: <nop>

xnoremap il ^og_
onoremap il :normal vil<CR>
xnoremap al 0o$
onoremap al :normal val<CR>
onoremap <leader> iw
"<nul> is c-spc
nnoremap <nul><space> <c-w><c-w>
nnoremap <nul>j <c-w>j
nnoremap <nul>k <c-w>k
nmap <silent> g] <Plug>(coc-definition)

command W silent w !sudo tee > /dev/null %
nnoremap <leader>W :W<cr>:q!<cr>
nnoremap <silent> gx :execute 'silent! !open ' . shellescape(expand('<cWORD>'), 1)<cr>
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END
