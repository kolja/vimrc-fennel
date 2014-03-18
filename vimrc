set enc=utf-8
let mapleader = ","
nnoremap \ ,
set scroll=5
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=1
set t_Co=256

scriptencoding utf-8
" Use Arrow keys to navigate buffers and create new windows
" see: http://www.rousette.org.uk/blog/archives/vim-and-zsh-oh-my/
nmap <D-left> :bp<CR>
nmap <D-right> :bn<CR>
nmap <up> <C-y>
nmap <down> <C-e>
nmap <C-right> <C-W>v
nmap <C-left> <C-W>v<C-W>l<CR>
nmap <C-up> <C-W>s<C-W>j<CR>
nmap <C-down> <C-W>s

set nocompatible
set incsearch
set hidden

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
set nofoldenable

"set tags=/Users/kwilcke/reboot/trunk/zalando-shop/tags
"let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"
" show linenumbers
set number
" highlight tabs and trailing spaces
set list listchars=tab:››,eol:¬,trail:·
nmap <leader>l :set list!<CR>

" GPG Default Receipients
let g:GPGDefaultRecipients=["kolja"]

" for ctags to work... see: http://stackoverflow.com/questions/1790623/how-can-i-make-vims-taglist-plugin-show-useful-information-for-javascript
" let g:tlist_javascript_settings = 'javascript;r:var;s:string;a:array;o:object;u:function'

" Set to auto read when a file is changed from the outside
set autoread

" allow NerdTree to set the Working Directory correctly
let NERDTreeChDirMode=2
"
"" When vimrc is edited, reload it
autocmd! bufwritepost nested vimrc source ~/.vim/vimrc

" Remove all trailing whitespace before a file is written
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.jeco set ft=html
autocmd BufNewFile,BufRead *.coffee set ft=coffee
autocmd BufNewFile,BufRead *.less set ft=css

" ------------------- Key mappings

" reload chrome from within vim
map <leader>r :!/usr/local/bin/chromereload.sh<cr><cr>

" command! Notes :e! ~/Documents/notes/pass/pass.txt.asc
"
nmap <leader>f :CtrlP /Users/kwilcke/dev/zeos/zalando-shop<CR>
nmap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_working_path = 0
nmap tt :NERDTreeTabsToggle<CR>
" nnoremap tt :call ToggleNERDTreeAndTagbar()<CR>

nmap n nzz
nmap N Nzz

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q @q

" jsHint
"nmap <leader>j :JSHint<cr>

nmap <leader>o :only<cr>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" jump to function definition in javascript
nmap <leader>, /<C-r><C-w>.*function/<CR>zt3<C-Y>
nmap <leader>s :%s/\v

" move blocks of text in visual mode
vmap <up> xkP`[V`]
vmap <down> xp`[V`]

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

" the default ClipBrd shortcut conflicts with NERDCommenter
" nmap <unique> <silent> <Leader>u <Plug>ClipBrdOpen

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
        set guifont=Meslo\ LG\ S\ for\ Powerline:h13
        set anti
        " my favourites:
        " candycode darkburn dante
        " redblack
        " ir_black, jellybeans, cthulhian,
        " darkdesert darkocean
        colors ir_black
    endif
endfunction

" http://stackoverflow.com/questions/6624043/how-to-open-or-close-nerdtree-and-tagbar-with-leader
function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
" --------------------- From Drews vimrc:

" Visual line repeat
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Strip trailing whitespace
function! Preserve(command)
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

nmap <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>

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
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'flazz/vim-colorschemes'
call s:setGuiOptions()
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "scrooloose/nerdtree"
Bundle 'jistr/vim-nerdtree-tabs'
Bundle "majutsushi/tagbar"
Bundle "kchmck/vim-coffee-script"
Bundle "groenewege/vim-less"
Bundle "michaeljsmith/vim-indent-object"
Bundle "godlygeek/tabular"
Bundle "maksimr/vim-jsbeautify"
Bundle "tomtom/tregisters_vim"
Bundle "scrooloose/nerdcommenter"
Bundle "genutils"

filetype plugin indent on

