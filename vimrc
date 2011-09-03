
set nocompatible
set hidden  " lusty explorer needs it

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" remap the leader to ',' 
let mapleader = ","
let g:mapleader = ","

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

if &t_Co > 2 || has("gui_running")
  syntax on
  set guioptions=-t " don't show the menu
  set hlsearch
  set ch=2          " Make command line two lines high
  set mousehide     " Hide the mouse when typing text
  set guifont=Monaco:h12
  set anti
  colors rubyblue
endif

" ------------------- Key mappings

nmap ff :FufFile<CR>
nmap fb :FufBuffer<CR>
nmap tt :NERDTreeToggle<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
map <leader>d :nohlsearch<CR>
map <leader>h <ctrl-w>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

" Kacpers preferences

set lcs=tab:\ \ ,trail:~,extends:>,precedes:<

let vala_comment_strings = 1 " Enable comment strings

autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala

set nu
set showmatch
set list
set nocp incsearch
