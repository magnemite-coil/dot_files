
" ============================================================
" Encoding
" ============================================================

set encoding=utf-8
scriptencoding utf-8

set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos
set ambiwidth=double


" ============================================================
" Plugin Manager: vim-plug
" ============================================================

call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'tomasr/molokai'

" Status line
Plug 'itchyny/lightline.vim'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Asynchronous syntax checking
Plug 'dense-analysis/ale'

" File and function search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'suy/vim-ctrlp-commandline'

" Text search
Plug 'rking/ag.vim'

call plug#end()


" ============================================================
" Filetype and Syntax
" ============================================================

filetype plugin indent on
syntax enable


" ============================================================
" Color Scheme
" ============================================================

set background=dark

if has('termguicolors') && &term =~# 'xterm\|screen\|tmux'
    set termguicolors
endif

try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185:/
    colorscheme default
endtry


" ============================================================
" Rainbow Parentheses
" ============================================================

let g:rainbow_active = 1


" ============================================================
" Status Line
" ============================================================

set laststatus=2
set noshowmode
set showcmd
set ruler


" ============================================================
" Command Line
" ============================================================

set wildmenu
set history=5000


" ============================================================
" Indentation
" ============================================================

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set nosmartindent


" ============================================================
" Common Lisp
" ============================================================

augroup common_lisp_settings
    autocmd!
    autocmd FileType lisp setlocal expandtab
    autocmd FileType lisp setlocal tabstop=2
    autocmd FileType lisp setlocal softtabstop=2
    autocmd FileType lisp setlocal shiftwidth=2
    autocmd FileType lisp setlocal autoindent
    autocmd FileType lisp setlocal lisp
    autocmd FileType lisp setlocal nosmartindent
    autocmd FileType lisp setlocal nocindent
    autocmd FileType lisp setlocal formatoptions-=t
augroup END


" ============================================================
" Search
" ============================================================

set incsearch
set ignorecase
set smartcase
set hlsearch

" Disable search highlighting with Esc Esc
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" Use very magic by default
nnoremap / /\v


" ============================================================
" Cursor and Navigation
" ============================================================

set number
set cursorline

set whichwrap=b,s,h,l,<,>,[,],~

" Move by displayed lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

set backspace=indent,eol,start


" ============================================================
" Parentheses and Matching
" ============================================================

set showmatch
set matchtime=2

" Extended % matching
packadd! matchit


" ============================================================
" Clipboard
" ============================================================
" 
" if has('clipboard')
"     set clipboard^=unnamedplus
" endif
" 


" OSのクリップボードとVimのヤンク・ペーストを共有する
if has('unnamedplus')
  set clipboard^=unnamedplus
elseif has('clipboard')
  set clipboard^=unnamed
endif



" ============================================================
" Mouse and Bell
" ============================================================

set mouse=
set belloff=all


" ============================================================
" Window
" ============================================================

set splitright


" ============================================================
" ALE
" ============================================================

" Run only explicitly configured linters
let g:ale_linters_explicit = 1

let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ }

" Keep error lists closed
let g:ale_open_list = 0

" Do not automatically modify files on save
let g:ale_fix_on_save = 0


" ============================================================
" CtrlP
" ============================================================

nnoremap <Leader>f :CtrlPFunky<CR>

let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100'
let g:ctrlp_show_hidden = 1
" let g:ctrlp_types = ['fil']
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['funky', 'commandline']

command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())

let g:ctrlp_funky_matchtype = 'path'

if executable('ag')
    let g:ctrlp_use_caching = 0
    let g:ctrlp_user_command = 'ag %s --hidden --nocolor -g ""'
endif

