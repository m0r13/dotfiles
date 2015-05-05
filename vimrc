set nocompatible
filetype off

set t_Co=256
let g:rehash256=1
let g:molokai_original=1
" plugin config
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'tomasr/molokai'

set laststatus=2

call vundle#end()
filetype plugin indent on

colorscheme molokai
set number

syntax enable

