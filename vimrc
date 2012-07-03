
set nocompatible
set incsearch
set hidden  " lusty explorer needs it
set undofile

call pathogen#infect()
call pathogen#helptags()
filetype on
filetype indent on
filetype plugin on

" Sets how many lines of history VIM has to remember
set history=700
set foldmethod=indent

" show linenumbers
set number

" GPG Default Receipients
let g:GPGDefaultRecipients=["kolja"]

let g:LustyJugglerSuppressRubyWarning = 1

" Set to auto read when a file is changed from the outside
set autoread

" remap the leader to ','
let mapleader = ","
let g:mapleader = ","

" allow NerdTree to set the Working Directory correctly
let NERDTreeChDirMode=2

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc/vimrc

" Remove all trailing whitespace before a file is written
autocmd FileType css,less,js,coffee autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd BufNewFile,BufRead *.json set ft=javascript 
autocmd BufNewFile,BufRead *.jeco set ft=html 

if &t_Co > 2 || has("gui_running")
  syntax on
  set guioptions=-t " don't show the menu
  set hlsearch
  set ch=2          " Make command line two lines high
  set mousehide     " Hide the mouse when typing text
  set guifont=Monaco:h14
  set anti
  colors ir_black
endif

" ------------------- Key mappings
command! Notes :e! ~/Documents/notes/pass/pass.txt.asc

nmap <leader>f :FufFile **/<CR>
nmap <leader>b :FufBuffer<CR>
nmap tt :NERDTreeToggle<CR>
nmap T!  :NERDTree<CR>

" Remove trailing whitespace:
nmap <leader>r :%s/\v\s+$//

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :wq<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc/vimrc<cr>

" Use Arrow keys to navigate buffers and create new windows
" see: http://www.rousette.org.uk/blog/archives/vim-and-zsh-oh-my/
nmap <left> :bp<CR>
nmap <right> :bn<CR>
nmap <up> <C-y>
nmap <down> <C-e>
nmap <C-right> <C-W>v
nmap <C-left> <C-W>v<C-W>l<CR>
nmap <C-up> <C-W>s<C-W>j<CR>
nmap <C-down> <C-W>s

" always use 'very magic' regexes
nmap / /\v

nmap <leader>s :%s/\v
" keep selection after shifting in/outdenting a block in Visual mode
vnoremap < <gv
vnoremap > >gv

" move blocks of text in visual mode
vmap <up> xkP`[V`]
vmap <down> xp`[V`]

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo dd of=%

" leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
map <leader>d :nohlsearch<CR>
map <leader>h <ctrl-w>

" Smart way to move beteen windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" intuitive paste
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Show in a new window the Subversion blame annotation for the current file. 
" problem: when there are local mods this doesn't align with the source file. 
" To do: When invoked on a revnum in a Blame window, re-blame same file up to previous rev. 
function! s:svnBlame() 
   let line = line(".") 
   setlocal nowrap 
   aboveleft 18vnew 
   setlocal nomodified readonly buftype=nofile nowrap winwidth=1 
   " blame, ignoring white space changes 
   %!svn blame -x-w "#" 
   " find the highest revision number and highlight it 
   "%!sort -n 
   "normal G*u 
   " return to original line 
   exec "normal " . line . "G" 
   setlocal scrollbind 
   wincmd p 
   setlocal scrollbind 
   syncbind 
endfunction 
map gb :call <SID>svnBlame()<CR> 
command! Blame call s:svnBlame() 

" Transparent editing of gpg encrypted files.
" By Wouter Hanegraaff <wouter@blub.net>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

set hlsearch
