
"   Plugins Setup
"   To install, run :PlugInstall
"   To setup, copilot, run :Copilot setup

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
call plug#end()

" Settings
syntax on
filetype on
filetype plugin indent on 

" Visual
set termguicolors
colorscheme zaibatsu
set background=dark

" Line
set number
set relativenumber

" Save all if exit command
au FocusLost * :wa

" Indents and Tabs
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Casing and Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" Syntax
autocmd BufRead,BufNewFile *.py set sytnax=python
autocmd BufRead,BufNewFile *.rs set sytnax=rust
autocmd BufRead,BufNewFile *.c,*.h set sytnax=c
autocmd BufRead,BufNewFile *.sh set sytnax=bash

" Time Optimization
set updatetime=300
set timeoutlen=500

" Status Line Options
set laststatus=2
set showcmd
set cursorline
set ruler

" Remappings
let mapleader = " "
inoremap jk <ESC>:w<CR>
nnoremap c "_c 
nnoremap x "_x
nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>td <C-w>w
nnoremap <Leader>to :tabnew %<CR> 
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tf :vertical resize 200<CR>
"nnoremap <Leader>ee :vsplit<CR>:vertical resize 60<CR>:Ex<CR>
