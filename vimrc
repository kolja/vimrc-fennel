
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype indent on
filetype plugin on

set nocompatible
set incsearch
set hidden  " lusty explorer needs it
set undofile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent

set hlsearch

" Sets how many lines of history VIM has to remember
set history=700
set foldmethod=indent
set tags=/Users/kwilcke/reboot/trunk/zalando-shop/tags
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" highlight tabs and trailing spaces
set list listchars=eol:¬,tab:>>,trail:·
nmap <leader>l :set list!<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
" see: http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! %!sudo tee > /dev/null %

" show linenumbers
set number

" GPG Default Receipients
let g:GPGDefaultRecipients=["kolja"]

let g:LustyJugglerSuppressRubyWarning = 1

" for ctags to work... see: http://stackoverflow.com/questions/1790623/how-can-i-make-vims-taglist-plugin-show-useful-information-for-javascript
let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'

" Set to auto read when a file is changed from the outside
set autoread

" remap the leader to ','
let mapleader = ","
let g:mapleader = ","

" allow NerdTree to set the Working Directory correctly
let NERDTreeChDirMode=2

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" Remove all trailing whitespace before a file is written
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.jeco set ft=html

if &t_Co > 2 || has("gui_running")
    syntax on
    set guioptions=-t " don't show the menu
    set guioptions=+R " show scrollbar
    set hlsearch
    set ch=2          " Make command line two lines high
    set mousehide     " Hide the mouse when typing text
    set guifont=Menlo:h15
    " set guifont=Monaco:h24
    set anti
    " my favourites:
    " ir_black, jellybeans, cthulhian,
    " redblack
    colors jellybeans
endif

" ------------------- Key mappings

" call colors for the word under the cursor
nmap <leader>c "cyiw:exe ":colors "@c<CR>

command! Notes :e! ~/Documents/notes/pass/pass.txt.asc

nmap <leader>f :FufFile **/<CR>
nmap <leader>b :FufBuffer<CR>
nmap tt :NERDTreeToggle<CR>
nmap T!  :NERDTree<CR>

nmap n nzz
nmap N Nzz

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :wq<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

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

" from vimcasts.org:
" Preserve last search and Cursor position (to execute arbitrary commands that
" would otherwise change them.
function! <SID>Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap <leader>r :call <SID>Preserve("%s/\\s\\+$//e")<CR>
autocmd BufWritePre *.rb,*.js :call <SID>Preserve("%s/\\s\\+$//e")

