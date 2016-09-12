set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'plasticboy/vim-markdown'

call vundle#end()

filetype plugin indent on

syntax enable

set encoding=utf-8
set ruler
set number
