" ==>> GENERAL

set t_Co=256
" don't bug me all the time
set visualbell
" use nifty non-vi features
set nocompatible
" disable the Ex mode
nnoremap Q <nop>
" erase old autocommands
au!
" reload .vimrc on save
au BufWritePost .vimrc source ~/.vimrc
" timeout for shortcuts
set timeoutlen=400
" mouse is really usefule sometimes
set mouse=a

let mapleader = ";"

set splitbelow
set splitright

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
cmap wm :w \| make

"" ==>> COLORS

set background=dark
let g:solarized_termcolors = 256
let g:solarized_visibility = "normal"
let g:solarized_contrast = "normal"
colorscheme solarized

" some highlighting (EasyMotion, Fugitive) doesn't work well with solarized
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment

if has("gui_running")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif
set guifont=Courier\ New\ bold:h14
set guioptions=

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
nmap <Leader>a :Ack -i <cword><CR>
" use ag not ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" save typing :nohl
noremap <Leader><space> :nohl<CR>
" jump to matching bracket for a short period of time
set showmatch

" search for tags all the way up to the root
set tags=./tags;$HOME

" gf searches recursively downwards the current directory
set path+=./**,**

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

" up/down consistent with wrapped lines
nnoremap j gj
nnoremap k gk

" sections jumping
noremap js ?==>><CR>:nohl<CR>zt
noremap ks /==>><CR>:nohl<CR>zt

nnoremap cP <esc>:let @" = expand("%")<CR>

"nnoremap <Leader>lf :ln<CR>
"nnoremap <Leader>lb :ln<CR>
"let g:lt_location_list_toggle_map = '<leader>ls'
"let g:lt_quickfix_list_toggle_map = '<leader>lc'
autocmd Filetype qf wincmd J

" toggle the paredit
let g:paredit_leader = ','
nnoremap <Leader>p :let paredit_mode=1 - paredit_mode<CR>::let paredit_mode<CR>

set pastetoggle=<F2>

" replacement from register
"nnoremap cp "_diw"0P
"vnoremap cp "_d"0P

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

let g:EasyMotion_leader_key = '<space>'

" keep my package sanity
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/cscope.vim'
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'a.vim'
Bundle 'vim-scripts/LustyJuggler'
Bundle 'camelcasemotion'
"Bundle 'scrooloose/syntastic'
"Bundle 'Valloric/YouCompleteMe'

nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" don't require extra confirmation to accept ycm config on startup
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_add_preview_to_completeopt = 0
"set completeopt-=preview
let g:LustyJugglerDefaultMappings = 0
nmap <silent> <Leader>j :LustyJuggler<CR>

" rainbow parentheses
let g:rbpt_loadcmd_toggle = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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

" Define a command to make it easier to use
command! -nargs=+ QFDo call QFDo(<q-args>)

if !exists("*QFDo")
  " Function that does the work
  function! QFDo(command)
      " Create a dictionary so that we can
      " get the list of buffers rather than the
      " list of lines in buffers (easy way
      " to get unique entries)
      let buffer_numbers = {}
      " For each entry, use the buffer number as 
      " a dictionary key (won't get repeats)
      for fixlist_entry in getqflist()
          let buffer_numbers[fixlist_entry['bufnr']] = 1
      endfor
      " Make it into a list as it seems cleaner
      let buffer_number_list = keys(buffer_numbers)

      " For each buffer
      for num in buffer_number_list
          " Select the buffer
          exe 'buffer' num
          " Run the command that's passed as an argument
          exe a:command
          " Save if necessary
          update
      endfor
    endfunction
endif

nmap <Leader>s <C-\>

" little mapping to help me with indentin
noremap <Leader>i 20i<tab><esc>kF(jldw
noremap ii ~hi

let g:bufExplorerSplitBelow=1

set exrc
set secure
