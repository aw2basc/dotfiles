call plug#begin()
" Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'xolox/vim-misc'
Plug 'sotte/presenting.vim'
Plug 'Shougo/vimproc.vim'
Plug 'ryanoasis/vim-devicons'
" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
" themes
Plug 'morhetz/gruvbox'
" syntax
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'groenewege/vim-less'
Plug 'Shutnik/jshint2.vim'
Plug 'aklt/plantuml-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components'
Plug 'jparise/vim-graphql'
" coc
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-eslint'
" Plug 'neoclide/coc-prettier'
Plug 'neoclide/coc-lists'
" debug
Plug 'puremourning/vimspector'
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
" PlugInstall [name ...] [#threads] Install plugins
" PlugUpdate [name ...] [#threads]  Install or update plugins
" PlugClean[!]  Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus  Check the status of plugins
" PlugDiff  Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] Generate script for restoring the current snapshot of the plugins

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
  set guifont=Sauce_Code_Powerline:h12:cANSI
else
  set guifont=FiraCode\ Nerd\ Font\ 20
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
" backup files
set nobackup
set nowritebackup
" coc
set cmdheight=2
set updatetime=300
set shortmess+=c
" clipboard
set clipboard=unnamedplus

" let g:clipboard = {
"             \   'name': 'WslClipboard',
"             \   'copy': {
"             \      '+': 'clip.exe',
"             \      '*': 'clip.exe',
"             \    },
"             \   'paste': {
"             \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"             \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
"             \   },
"             \   'cache_enabled': 0,
"             \ }

" if has ('wsl')
"   let g:clipboard = {
"         \   'name': 'win32yank-wsl',
"         \   'copy': {
"         \      '+': 'win32yank.exe -i --crlf',
"         \      '*': 'win32yank.exe -i --crlf',
"         \    },
"         \   'paste': {
"         \      '+': 'win32yank.exe -o --lf',
"         \      '*': 'win32yank.exe -o --lf',
"         \   },
"         \   'cache_enabled': 0,
"         \ }
" endif 
" if has('wsl')
"   augroup Yank
"     autocmd!
"     autocmd TextYankPost * :call system('win32clip.exe ',@")
"   augroup END
" endif

" markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" typescript syntax tweak
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

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

" vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" coc
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git']
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')

command! -nargs=? Fold :call     CocAction('fold', <f-args>)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
