set nocompatible
filetype off

set t_Co=256
let g:rehash256=1
let g:molokai_original=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t' " show just filename

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
" Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Valloric/YouCompleteMe'

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

