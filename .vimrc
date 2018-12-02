call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'

call plug#end()

" vim-javascript
let g:javascript_plugin_jsdoc=1

" General
set shell=/bin/bash

syntax on
syntax enable

filetype plugin on
filetype indent on

set encoding=utf8
set laststatus=2
set noshowmode
set autoread
set cursorline
set number
set linebreak
set textwidth=100
set showmatch
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2
