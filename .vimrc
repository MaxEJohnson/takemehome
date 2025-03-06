
"   Plugins Setup
"   To install, run :PlugInstall
"   To setup, copilot, run :Copilot setup

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
call plug#end()

" Settings
syntax on
filetype on
filetype plugin indent on 

" Visual
set termguicolors
colorscheme zaibatsu
set background=dark
highlight DiffAdd cterm=bold ctermfg=none ctermbg=DarkGreen
highlight DiffChange cterm=bold ctermfg=none ctermbg=DarkYellow
highlight DiffDelete cterm=bold ctermfg=none ctermbg=DarkRed
highlight DiffText cterm=bold ctermfg=10 ctermbg=DarkBlue

" Line
set number
set relativenumber
autocmd FileType netrw setlocal number relativenumber 
set scrolloff=8

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
autocmd FileType python,c,rust,bash nnoremap <C-]> :LspPeekDefinition<CR>
autocmd FileType python,c,rust,bash nnoremap <C-[> :LspDefinition<CR>

" Time Optimization
set updatetime=300
set timeoutlen=500

" Status Line Options
set laststatus=2
set showcmd
set cursorline
set ruler

" Functions
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

function! JumpToTerm()
    for tab in gettabinfo()
        for win in tab.windows()
            if getbufvar(winbufnr(win), "&buftype") ==# "terminal"
                execute  tab.tabnr . 'tabnext'
                call win_gotoid(win)
                return
            endif
        endfor
    endfor
    tab term
endfunction

" Remappings
let mapleader = " "
inoremap jk <ESC>:w<CR>
nnoremap c "_c 
nnoremap x "_x
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
" Window and Tab remaps
nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>td <C-w>w
nnoremap <Leader>to :tabnew %<CR> 
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tf :vertical resize 200<CR>
" Dir Search remaps
nnoremap <Leader>ee :Ex<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fg :Rg<CR>
" Buffer remaps
nnoremap <Leader>bl :ls<CR>
nnoremap <Leader>bd :bd<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Leader><Leader> :b#<CR>
" Git remaps
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gd :Gdiffsplit<CR>
" LSP remaps
nnoremap <Leader>ls :LspStop<CR>
" Term remaps
nnoremap <Leader>tt :call JumpToTerm()<CR>
tnoremap <C-t> <C-\><C-n>:tabprevious<CR>
