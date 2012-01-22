set nocompatible

"shows cursor
set ruler
set showmode
set showcmd

syntax on

" lower priority on tab completion
set suffixes=.pyc,.bak,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set hlsearch
set ignorecase
set incsearch
" continues search from beginning 
set wrapscan

" see where my whitespace is
set listchars=tab:\.\ ,nbsp:~,trail:_

set guifont=courier_new:h10
set number

set enc=utf-8
set bg=dark

" indent
set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set so=10

" timeout for shortcuts
set tm=200

" pressing j and k together escapes
inoremap jk <esc>
inoremap kj <esc>
inoremap KJ <esc>
inoremap JK <esc>
" in normal mode jk/kj is a small jump
noremap jk 10j0w  
noremap kj 10k0w 

let mapleader = "\\"
noremap <Leader>a :Ack -i <cword><CR>
nnoremap <Leader>n :cn<CR>
"nnoremap <Leader>p :cp<CR>

" set nowrap
set textwidth=150
set fileencodings=utf-8,iso-8859-2

set tags=tags;
set history=50

" keep my package sanity
call pathogen#runtime_append_all_bundles()

if has("autocmd")
  filetype plugin indent on 

  autocmd FileType python source ~/.vimrc_py
  autocmd FileType haskell source ~/.vimrc_hs
  autocmd FileType d source ~/.vimrc_d

  " this didn't work when in bundle/vimclojure-2/ftdetect
  autocmd BufNewFile,BufRead *.clj set filetype=clojure
  autocmd BufNewFile,BufRead *.cljs set filetype=clojure
  "autocmd BufOnClose * :%s/\s*$//e
endif

colorscheme delek

map gd [I
" yank to the end of the line
map Y y$
" reload
map _rld :source ~/.vimrc

imap (( ()<esc>i
imap [[ []<esc>i
imap {{ {}<esc>i

let g:tex_flavor='latex'

" neocomplcache TODO revise
let g:neocomplcache_enable_at_startup = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
noremap <F2> :NERDTree<CR>
noremap <F5> :bn<CR>
noremap <F6> :bp<CR>

set foldmethod=manual

" vimclojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = $HOME . "/.vim/bin/ng"

