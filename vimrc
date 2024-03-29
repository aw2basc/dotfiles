" vundle
" daily builds
" https://bintray.com/micbou/generic/vim
set nocompatible
filetype off
if has("win32")
  set shellslash
  set rtp+=~/vimfiles/bundle/Vundle.vim
  call vundle#begin('~/vimfiles/bundle')
else
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
endif
Plugin 'VuldleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'xolox/vim-misc'
Plugin 'sotte/presenting.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ryanoasis/vim-devicons'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'airblade/vim-gitgutter'
" themes
Plugin 'morhetz/gruvbox'
" syntax
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'groenewege/vim-less'
Plugin 'Shutnik/jshint2.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'MaxMEllon/vim-jsx-pretty'
" typescript
Plugin 'leafgarland/typescript-vim'
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
set t_Co=256
set background=dark
colorscheme gruvbox
if has("win32")
  set guifont=FiraMono_NF:h12:cANSI
else
  set guifont=FiraCode\ Nerd\ Font\ 20
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
set tabstop=2
set shiftwidth=2
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
" remove toolbar
set guioptions-=T
" do not add eol if not there
set nofixendofline
" folding
set foldlevelstart=20
set foldmethod=manual
" autocmd Syntax json,xml,html,xhtml setlocal foldmethod=syntax
" autocmd Syntax json,xml,html,xhtml normal zR

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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline_theme = 'gruvbox'
if has("gui_running")
  let g:airline_powerline_fonts = 1
endif

" nerdtree
map <C-n> :NERDTreeToggle %<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.swp$']

" nerd tree highlight
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

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
