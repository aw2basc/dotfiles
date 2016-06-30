" daily builds
" https://bintray.com/micbou/generic/vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VuldleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'groenewege/vim-less'
Plugin 'Shutnik/jshint2.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
" Vundle
" :PluginList
" :PluginInstall
" :PluginUpdate
" :PluginSearch plugin
" :PluginClean

" ctrl v paste etc
source $VIMRUNTIME/mswin.vim
behave mswin

" scheme
syntax enable
set background=dark
colorscheme solarized
if has("win32")
  set guifont=Source_Code_Pro:h12:cANSI
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
set tabstop=4
set shiftwidth=4
set expandtab
" allow backspace
set backspace=indent,eol,start
" wordwrap
set nowrap
set guioptions+=b
" show ruler
set ruler
" highlight as you search
set incsearch
" highligh search
set hlsearch
set ignorecase

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m^/node_modules/', '\m\c\.d.ts$']
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
