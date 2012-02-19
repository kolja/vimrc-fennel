
set nocompatible
set hidden  " lusty explorer needs it

call pathogen#runtime_append_all_bundles()
filetype on
filetype indent on
filetype plugin on

" Sets how many lines of history VIM has to remember
set history=700

" GPG Default Receipients
let g:GPGDefaultRecipients=["kolja"]

let g:LustyJugglerSuppressRubyWarning = 1

" Set to auto read when a file is changed from the outside
set autoread

" remap the leader to ','
let mapleader = ","
let g:mapleader = ","

" Nerd Tree will set vims Rootdirectory to its own when invoked
let NERDTreeChDirMode=1

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc/vimrc

if &t_Co > 2 || has("gui_running")
  syntax on
  set guioptions=-t " don't show the menu
  set hlsearch
  set ch=2          " Make command line two lines high
  set mousehide     " Hide the mouse when typing text
  set guifont=Monaco:h12
  set anti
  colors ir_black
endif

" ------------------- Key mappings
nmap ff :FufFile **/<CR>
nmap fb :FufBuffer<CR>
nmap tt :NERDTreeToggle<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc/vimrc<cr>

" leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
map <leader>d :nohlsearch<CR>
map <leader>h <ctrl-w>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" make backspace behave like I expect it to in normal mode
:nmap <CR> :call Backspace()
:fun! Backspace()
  if col(".") == col("$")-1 " cursor at end of line
    execute "normal!a\<CR>\<Esc>" " append a <CR>
  else
    execute "normal!i\<CR>\<Esc>"
  endif
endfun

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
