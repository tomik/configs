" ==>> GENERAL

set t_Co=256
" don't bug me all the time
set visualbell
" use nifty non-vi features
set nocompatible
" erase old autocommands
au!
" reload .vimrc on save
au BufWritePost .vimrc source ~/.vimrc
" timeout for shortcuts
set timeoutlen=200
" mouse is really usefule sometimes
set mouse=a

let mapleader = ";"

"" ==>> FILES AND BUFFERS

filetype off
filetype plugin indent on
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

noremap <Leader>e :NERDTree<CR>
" quick buffer switching
noremap <Leader>j <C-^>

" autosave on buffer switch
set autowrite

" get rid of whitespace
" au BufLeave * silent! %s/[ \t]*$//g

" save file as root
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

"" ==>> COLORS

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

"" ==>> SEARCH AND INDEX

set hlsearch
set ignorecase
" when search pattern contains uppercase char disable ignorecase
set smartcase
set incsearch
" continues search from beginning
set wrapscan

" lower priority on tab completion
set suffixes=.pyc,.bak,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set history=50

" search work under cursor
noremap <Leader>a :Ack -i <cword><CR>
" save typing :nohl
noremap <Leader><space> :nohl<CR>
" jump to matching bracket for a short period of time
set showmatch

" search for tags all the way up to the root
set tags=./tags;$HOME

" ==>> INDENTING

set expandtab
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
" spaces for autoindent
set shiftwidth=2
" see where my whitespace is
set list
set listchars=tab:\.\ ,nbsp:~,trail:_
set foldmethod=manual

" ==>> USEFUL
inoremap {{ {<CR>}<Esc>O

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
nnoremap <Leader>p :cn<CR>
autocmd Filetype qf wincmd J

" paste mode
"nnoremap <Leader>i :set paste<CR>
"nnoremap <Leader>I :set nopaste<CR>

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
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.clj set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.html set filetype=html

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

" vimclojure
let g:vimclojure#FuzzyIndent=1
let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#HighlightContrib=1
let g:vimclojure#DynamicHighlighting=1
let g:vimclojure#ParenRainbow=1
let g:vimclojure#WantNailgun = 0
let g:vimclojure#NailgunClient = $HOME . "/.vim/bin/ng"

" keep my package sanity
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" TODO Move this to a plugin
" Function to find files in subdirectories.
" Credits to Vladimir Marek and http://vim.wikia.com/wiki/VimTip1234
function! Find(name)
  let l:list=system("find . -name '*".a:name."*' | grep -v \".svn/\" | perl -ne 'print \"$.\\t$_\"'")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")

nmap <Leader>s <C-\>
" I want to tell myself by <C-X><C-U> when I want to autocomplete.
let g:clang_complete_auto = 0
let g:clang_library_path = "/Volumes/data/Users/tomik/Downloads//clang+llvm-3.1-x86_64-apple-darwin11/lib"
" /Developer/usr/clang-ide/lib/

function! RefreshCS()
  :silent ! find . -name "*cpp" -o -name "*hpp" > cscope.files
  :silent cs kill 0
  :silent cs add cscope.out
  :silent !ctags -R .
endfunction

" refresh cscope and ctags
nmap <Leader>r :exec RefreshCS()<CR>

" use supertab with clang_complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"

" little mapping to help me with indentin
noremap <Leader>i 20i<tab><esc>kF(jldw
noremap ii ~hi

let g:bufExplorerSplitBelow=1

set exrc
set secure
