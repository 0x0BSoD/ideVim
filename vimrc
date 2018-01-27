set nocompatible              " be iMproved, required
filetype off                  " required
let fortran_free_source=1
let fortran_do_enddo=1
let t_Co=256
let g:indentLine_color_term=239
filetype plugin indent on
syntax   on

" tabs
set tabstop=8
set shiftwidth=8
set smarttab
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim



" set section
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set mouse=a

" for plugins
set background=dark
colorscheme solarized
set laststatus=2
set list lcs=tab:\|\

let g:instant_markdown_slow = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
nmap <silent> <leader>b :TagbarToggle<CR>
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1

let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = "
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" --------------------Keys------------------------
map <C-n> : NERDTreeToggle<CR>
map <F9>  : TagbarToggle<CR>
"set makeprg=[[\ -f\ Makefile\ ]]\ &&\ make\ \\\|\\\|\ make\ -C\ ..
compiler! gfortran
" Save all and build
map <F7> :wall \| make all<Cr>
" " Run executable
map <F8> :make run<Cr>
" " Go to next error
map <F6> :cn<Cr>zvzz:cc<Cr>
" " Go to previous error
map <F5> :cp<Cr>zvzz:cc<Cr>
" -----------------------------------------------
call vundle#begin()
" ----------PlugInst---------------------------

" look and feel
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
" plushki :)
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'NBUT-Developers/extra-instant-markdown'
" for man
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-superman'
" better editung
Plugin 'Raimondi/delimitMate'
Plugin 'Yggdroot/indentLine'
" syntax
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'

" ----------EndPlugins--------------------------
"
call vundle#end()            " required
filetype plugin indent on    " required
