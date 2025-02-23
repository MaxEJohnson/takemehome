" Settings
syntax enable
set number
set tabstop=4
set shiftwidth=4
set background=dark
filetype plugin on
au FocusLost * :wa

" Remappings
let mapleader = " "
inoremap jk <ESC>
nnoremap c "_c 
nnoremap x "_x
nnoremap <Leader>sv :vsplit<CR>
nnoremap <Leader>td <C-w>w
nnoremap <Leader>to :tabnew %<CR> 
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>ee :vsplit<CR>:vertical resize 60<CR>:Ex<CR>
nnoremap <Leader>tf :vertical resize 200<CR>
