set nocompatible

""" basic things

filetype on
filetype indent on
filetype plugin on

syntax on
set number
set clipboard=unnamed

autocmd BufWritePost .vimrc source %

set showmode
set showcmd
set wildmenu
set wildignore=*.o,*.pyc

""" keybindings
let mapleader = ","

nmap <leader>w :w!<cr>
nmap <F8> :!make<cr>
nmap <F9> :!cd %:p:h && pdflatex %:p<cr>

nmap <leader>m :tabn<cr>
nmap <leader>n :tabp<cr>

" indendate whole blocks with < and >
vmap < <gv
vmap > >gv

""" indendation
set ai
set si

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" file specific things
autocmd FileType tex set textwidth=72

