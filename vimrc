" daily builds
" https://bintray.com/micbou/generic/vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VuldleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'groenewege/vim-less'
Plugin 'Shutnik/jshint2.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
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
" https://github.com/ryanoasis/nerd-fonts.git
syntax enable
set background=dark
colorscheme solarized
if has("win32")
  set guifont=Sauce_Code_Powerline:h12:cANSI
else
  set guifont=SauceCodePro\ Nerd\ Font\ 12
  " set guifont=Source\ Code\ Pro\ Regular\ 12
endif

" buffers
set hidden
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
" statusline
set laststatus=2
" updatetime
set updatetime=250
" completion menu
set completeopt-=preview

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
let g:syntastic_ignore_files = ['\m^/node_modules/']
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
" let g:syntastic_typescript_tsc_args = "-t ES5 -m system --experimentalDecorators --emitDecoratorMetadata --sourceMap true --moduleResolution node --removeComments false"
" let g:syntastic_typescript_tsc_args = "-p ~/DEV/CDX-10/client/tsconfig.json"

" Move tabs with alt + left|right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#exclude_preview = 1

" nerdtree
map <C-n> :NERDTreeToggle %<CR>
let NERDTreeQuitOnOpen=1

" powerline
" https://powerline.readthedocs.io/en/master/installation.html#patched-fonts
let g:airline_powerline_fonts = 1

" nerd tree highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" tsuquyomi
let g:tsuquyomi_use_local_typescript = 0
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript setlocal completeopt+=preview
set ballooneval
autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()

" youcompleteme
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
