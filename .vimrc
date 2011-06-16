
"not like vi
set nocompatible

"shows cursor
set ruler
set showmode
set showcmd

syntax on

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.pyc,.bak,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Search
set hlsearch
set ignorecase
set incsearch
" continues search from beginning 
set wrapscan

set listchars+=tab:>-

set guifont=courier_new:h10
set number

set enc=utf-8
set bg=dark

" Indent
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

let mapleader = "\\"
noremap <Leader>a :Ack -i <cword><CR>

"set nowrap
set textwidth=150
set fileencodings=utf-8,iso-8859-2

set history=50

"packages management
call pathogen#runtime_append_all_bundles()

if has("autocmd")
  " Enabled file type detection
  " Use the default filetype settings. If you also want to load indent files
  " to automatically do language-dependent indenting add 'indent' as well.
	filetype plugin on

  autocmd VimEnter * echo "Let's do this ..."
  autocmd VimLeave * echo "Good job!"
  autocmd FileType python source ~/.vimrc_py
  autocmd FileType haskell source ~/.vimrc_hs
  autocmd FileType d source ~/.vimrc_d

  "autocmd BufOnClose * :%s/\s*$//e
endif

colorscheme delek

map gd [I
" Yank to the end of the line
map Y y$
"reload
map _rld :source ~/.vimrc

"cmap vsp vsplit

" map numpad
imap Oq 1
imap Or 2
imap Os 3
imap Ot 4
imap Ou 5
imap Ov 6
imap Ow 7
imap Ox 8
imap Oy 9
imap Op 0
imap On .
imap Oo /
imap Oj *
imap Om -
imap Ok +
imap OM 

filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

ab teh the

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
noremap <F3> :bn<CR>
noremap <F2> :bp<CR>

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
set foldmethod=manual

