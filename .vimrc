
"   Plugins Setup
"   To install, run :PlugInstall
"   To setup, copilot, run :Copilot setup

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
"Plug 'github/copilot.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'rust-lang/rust.vim'
Plug 'voldikss/vim-floaterm'
call plug#end()

" Settings
syntax on
filetype on
filetype plugin indent on 
let g:rustfmt_autosave = 1

" Visual
set termguicolors

" Personal Colorscheme
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

" Main UI
hi Normal         guifg=#FFFFFF guibg=#000000 ctermfg=15 ctermbg=0
hi CursorLine     guibg=#1a1a1a ctermbg=234
hi CursorColumn   guibg=#1a1a1a ctermbg=234
hi ColorColumn    guibg=#2a0000 ctermbg=52
hi LineNr         guifg=#555555 guibg=#000000 ctermfg=240 ctermbg=0
hi CursorLineNr   guifg=#FF0000 guibg=#1a1a1a ctermfg=196 ctermbg=234
hi VertSplit      guifg=#444444 guibg=#000000 ctermfg=238 ctermbg=0
hi SignColumn     guibg=#000000 ctermbg=0

" Search & Selection
hi Visual         guibg=#005f5f ctermbg=23
hi Search         guifg=#000000 guibg=#FFFF00 ctermfg=0 ctermbg=226
hi IncSearch      guifg=#000000 guibg=#FF5F00 ctermfg=0 ctermbg=202
hi MatchParen     guibg=#4444FF ctermbg=27

" Status Line
hi StatusLine     guifg=#FFFFFF guibg=#005f5f gui=bold ctermfg=15 ctermbg=23
hi StatusLineNC   guifg=#777777 guibg=#1a1a1a ctermfg=244 ctermbg=234

" Syntax Highlighting
hi Comment        guifg=#5F87FF gui=italic ctermfg=69
hi Constant       guifg=#FF5F5F ctermfg=203
hi String         guifg=#FF5F87 ctermfg=204
hi Identifier     guifg=#5F87FF ctermfg=69
hi Statement      guifg=#FF0000 gui=bold ctermfg=196
hi PreProc        guifg=#FF8700 ctermfg=208
hi Type           guifg=#5FFF00 ctermfg=82
hi Special        guifg=#00FFFF ctermfg=14
hi Function       guifg=#00afff gui=bold ctermfg=39
hi Number         guifg=#FF5F00 ctermfg=202
hi Boolean        guifg=#FF0000 ctermfg=196
hi Keyword        guifg=#FF0000 gui=bold ctermfg=196
hi Operator       guifg=#FFFFFF ctermfg=15

" Error & Todo
hi Error          guifg=#FFFFFF guibg=#FF0000 ctermbg=196
hi Todo           guifg=#000000 guibg=#FFFF00 ctermfg=0 ctermbg=226
hi WarningMsg     guifg=#FFFF00 ctermfg=226
hi ErrorMsg       guifg=#FFFFFF guibg=#870000 ctermfg=15 ctermbg=88

" Popup & Completion
hi Pmenu          guibg=#1c1c1c guifg=#FFFFFF ctermbg=234 ctermfg=15
hi PmenuSel       guibg=#005f5f guifg=#FFFFFF ctermbg=23 ctermfg=15
hi PmenuSbar      guibg=#444444 ctermbg=238
hi PmenuThumb     guibg=#CCCCCC ctermbg=250

" Misc
hi Title          guifg=#00FFFF gui=bold ctermfg=14
hi Directory      guifg=#5F87FF gui=bold ctermfg=69
hi Underlined     guifg=#00AFFF gui=underline ctermfg=39
hi ModeMsg        guifg=#00FFAF ctermfg=49
hi MoreMsg        guifg=#00FFAF ctermfg=49
hi Question       guifg=#FFFF5F ctermfg=227
hi WildMenu       guibg=#5f0000 guifg=#FFFFFF ctermbg=52 ctermfg=15

let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

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
autocmd BufRead,BufNewFile *.py set syntax=python
autocmd BufRead,BufNewFile *.c,*.h set syntax=c
autocmd BufRead,BufNewFile *.rs set syntax=rs
autocmd BufRead,BufNewFile *.sh set syntax=bash
autocmd FileType python,c,rust,bash nnoremap <C-[> :LspDefinition<CR>

command! VuitVSplit vertical terminal vuit 

let g:lsp_diagnostics_enabled = 1

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
nnoremap <Leader>ff :VuitVSplit<CR>
nnoremap <Leader>fg :Rg<CR>
" Buffer remaps
nnoremap <Leader>bl :Buffers<CR>
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
nnoremap <Leader>tt :FloatermToggle<CR>
