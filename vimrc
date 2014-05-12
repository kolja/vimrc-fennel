
filetype off

" for docs see: help vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'L9'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'mattn/emmet-vim'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rking/ag.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'godlygeek/tabular'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tomtom/tregisters_vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'genutils'
call vundle#end()

filetype plugin indent on

set enc=utf-8
let mapleader = ","
nnoremap \ ,
set scroll=5
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:user_emmet_leader_key='`'
let g:user_emmet_expandabbr_key = '`'
set laststatus=1
set t_Co=256

let g:agprg="ag --column --smart-case -U"

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
nmap <leader>f :CtrlP /Users/kolja/dev/shop/webapp/src/main/webapp<CR>
nmap <leader><leader>f :CtrlP /Users/kolja/dev/shop/frontend<CR>
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
        set guifont=Meslo\ LG\ M\ for\ Powerline:h13
        set anti
        " my favourites:
        " candycode darkburn dante
        " redblack
        " ir_black, jellybeans, cthulhian,
        " darkdesert darkocean
        colorscheme ir_black
    endif
endfunction

call s:setGuiOptions()

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
nnoremap <leader>u :call Preserve("Gread -")<CR>

