
let mapleader = ","
set scroll=5

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
set laststatus=2

" don't use swapfiles. Use git instead
set nobackup
set nowritebackup
set noswapfile
set hlsearch

" allways use OSX's clipboard
set clipboard=unnamed

" Sets how many lines of history VIM has to remember
set history=700
set foldmethod=indent

"set tags=/Users/kwilcke/reboot/trunk/zalando-shop/tags
"let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"
" show linenumbers
set number
" highlight tabs and trailing spaces
set list listchars=tab:››,eol:¬,trail:·
nmap <leader>l :set list!<CR>

" GPG Default Receipients
"let g:GPGDefaultRecipients=["kolja"]

" for ctags to work... see: http://stackoverflow.com/questions/1790623/how-can-i-make-vims-taglist-plugin-show-useful-information-for-javascript
"let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'

"" Set to auto read when a file is changed from the outside
"" set autoread

" allow NerdTree to set the Working Directory correctly
" let NERDTreeChDirMode=2
"
"" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc
"
" Remove all trailing whitespace before a file is written
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.jeco set ft=html
autocmd BufNewFile,BufRead *.coffee set ft=coffee

" ------------------- Key mappings

" reload chrome from within vim

map <leader>c :!/usr/local/bin/chromereload.sh<cr><cr>

" call colors for the word under the cursor
nmap <leader>c "cyiw:exe ":colors "@c<CR>

" command! Notes :e! ~/Documents/notes/pass/pass.txt.asc
"
nmap <leader>f :FufFile **/<CR>
nmap <leader>b :FufBuffer<CR>
nmap tt :NERDTreeToggle<CR>
nmap T!  :NERDTree<CR>

nmap n nzz
nmap N Nzz

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :wq<cr>

" jsHint
"nmap <leader>j :JSHint<cr>

nmap <leader>o :only<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" jump to function definition in javascript
nmap <leader>, /<C-r><C-w>.*function/<CR>zt3<C-Y>
nmap <leader>s :%s/\v

" keep selection after shifting in/outdenting a block in Visual mode
vnoremap < <gv
vnoremap > >gv

" move blocks of text in visual mode
vmap <up> xkP`[V`]
vmap <down> xp`[V`]

" Allow saving of files as sudo when I forgot to start vim using sudo.
" see: http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------[ preconfig
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

" make A and I work in visual mode as they do in visual block mode
vnoremap <C-q> <esc>'<<C-q>'>$ 

" always use 'very magic' regexes
nmap / /\v

function! s:setGuiOptions()
    if &t_Co > 2 || has("gui_running")
        syntax on
        set guioptions=-t " don't show the menu
        set guioptions=+R " show scrollbar
        set hlsearch
        set ch=2          " Make command line two lines high
        set mousehide     " Hide the mouse when typing text
        " set guifont=Menlo:h14
        " set guifont=Monaco:h24
        set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
        set anti
        " my favourites:
        " ir_black, jellybeans, cthulhian,
        " redblack
        colors jellybeans
    endif
endfunction

" --------------------------------------------------[ vundle  

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Command-T'
Bundle 'flazz/vim-colorschemes'
call s:setGuiOptions()
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle "scrooloose/nerdtree"
Bundle "kchmck/vim-coffee-script"
Bundle "michaeljsmith/vim-indent-object"

filetype plugin indent on

