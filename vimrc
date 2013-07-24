"--------------------------------------------------[ preconfig

let mapleader = ","

" Use Arrow keys to navigate buffers and create new windows
" see: http://www.rousette.org.uk/blog/archives/vim-and-zsh-oh-my/
"nmap <left> :bp<CR>
"nmap <right> :bn<CR>
nmap <up> <C-y>
nmap <down> <C-e>
"nmap <C-right> <C-W>v
"nmap <C-left> <C-W>v<C-W>l<CR>
"nmap <C-up> <C-W>s<C-W>j<CR>
"nmap <C-down> <C-W>s
 
" move blocks of text in visual mode
" does not work correctly
vmap <up> xkP`[V`]
vmap <down> xp`[V`]

"always use 'very magic' regexes
nmap / /\v

"--------------------------------------------------[ vundle  
set nocompatible               " be iMproved
filetype off                   " required! for vundle 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" My Bundles here:
"
" original repos on github
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...



"--------------------------------------------------[ vimwiki
set nocompatible
filetype plugin on
syntax on

Bundle 'vimwiki/vimwiki'



"--------------------------------------------------[ fugitive
" configure me 
"Bundle 'tpope/vim-fugitive'

