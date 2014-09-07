set nocompatible
" Vundle
" :PluginList
" :PluginInstall
" :PluginSearch plugin
" :PluginClean
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'
call vundle#end()
filetype plugin indent on

" ctrl v paste etc
source $VIMRUNTIME/mswin.vim
behave mswin

" scheme
syntax enable
set background=dark
colorscheme solarized
if has("win32")
  set guifont=Source_Code_Pro:h11:cANSI
else
  set guifont=Source\ Code\ Pro\ Regular\ 12
endif
" cursor highlight line
set cursorline
" line numbers
set number
" spell check
set spell
" encoding
scriptencoding utf-8
set encoding=utf-8
" tabs as spaces
set tabstop=2
set shiftwidth=2
set expandtab
" allow backspace
set backspace=indent,eol,start
" wordwrap
set nowrap
" show ruler
set ruler
" highlight as you search
set incsearch
" highligh search
set hlsearch
set ignorecase

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

