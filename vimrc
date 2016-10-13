set nocompatible
filetype off

set t_Co=256
let g:rehash256=1

let g:molokai_original=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " show just filename

let g:ycm_confirm_extra_conf = 0

let g:localvimrc_persistent = 1

" let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.frag,*.geom'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
" Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'tikhomirov/vim-glsl'
" Plugin 'beyondmarc/glsl.vim'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

" make it fancy
syntax enable
set background=dark
" colorscheme molokai
colorscheme gruvbox
" colorscheme solarized
set number
set laststatus=2 " always display status linee
set hlsearch " highlight previous matches when searching something

" indendation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" show indendation types
set list
set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" keybindings
let mapleader = ","

" nnoremap th  :tabfirst<CR>
" nnoremap tj  :tabnext<CR>
" nnoremap tk  :tabprev<CR>
" nnoremap tl  :tablast<CR>

nnoremap <leader>n :tabprev<CR>
nnoremap <leader>m :tabnext<CR>

nmap <F9> :!cd %:p:h && pdflatex %:p<cr>

" misc
" fix bug with YouCompleteMe
set shortmess+=c
