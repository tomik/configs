" ==>> GENERAL

" use nifty non-vi features
set nocompatible
" erase old autocommands
au!
" reload .vimrc on save
au BufWritePost .vimrc source ~/.vimrc
" timeout for shortcuts
set timeoutlen=200
let mapleader = ";"

colorscheme zellner

"" ==>> FILES AND BUFFERS

filetype plugin on 
filetype indent on 
syntax on

set enc=utf-8
set fileencodings=utf-8,iso-8859-2
" reload on change
set autoread
set autowrite
set noswapfile
set nobackup
set nowritebackup
" allow unloading unsaved buffer
set hidden

noremap <Leader>N :NERDTree<CR>
" quick buffer switching
noremap <Leader>d :bp<CR>
noremap <Leader>f :bn<CR>
noremap <Leader>s <C-^>

"" ==>> SEARCH AND INDEX

set hlsearch
set ignorecase
set incsearch
" continues search from beginning 
set wrapscan

" lower priority on tab completion
set suffixes=.pyc,.bak,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tags=tags;
set history=50

" search work under cursor
noremap <Leader>a :Ack -i <cword><CR>

" ==>> INDENTING

set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
" spaces for autoindent
set shiftwidth=2
" see where my whitespace is
set listchars=tab:\.\ ,nbsp:~,trail:_
set foldmethod=manual
set textwidth=150
set scrolloff=10

" ==>> GETTING AROUND

" short movements
noremap <C-P> 10k
noremap <C-N> 10j

" up/down consistent with wrapped lines
nnoremap j gj
nnoremap k gk

" sections jumping 
noremap js ?==>><CR>:nohl<CR>zt
noremap ks /==>><CR>:nohl<CR>zt

" navigating in copen
nnoremap <Leader>n :cn<CR>
nnoremap <Leader>p :cp<CR>

" replacement from register
nnoremap S "_diw"0P
vnoremap S "_d"0P

map Y y$

" ==>> VIM MODES

" pressing j and k together escapes
inoremap jk <esc>
inoremap kj <esc>
inoremap KJ <esc>
inoremap JK <esc>

" info on cursor position in statusline
set ruler
set showmode
set showcmd
set number
set wildmenu

" ==>> FILE SPECIFIC

" this didn't work when in bundle/vimclojure-2/ftdetect
au BufNewFile,BufRead *.clj set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.coffee set filetype=coffee

" compile coffee script files on save
au BufWritePost *.coffee !coffee -c <afile> 2>&1

" compile less files on save
au BufWritePost *.less !lessc -c <afile> > %<.css

au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python ab pymain if __name__ == '__main__':

au FileType haskell set tabstop=4
au FileType haskell set softtabstop=4
au FileType haskell set shiftwidth=4

au FileType coffee set tabstop=2
au FileType coffee set softtabstop=2
au FileType coffee set shiftwidth=2

au FileType html set tabstop=2
au FileType html set softtabstop=2
au FileType html set shiftwidth=2

"c like behaviour for multiline comments
au FileType d source setlocal fo-=t fo+=croql
au FileType d source set foldmethod=indent

" ==>> PACKAGES

" keep my package sanity
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" vimclojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/bin/ng"

