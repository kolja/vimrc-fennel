
source ~/.vim/vimrc-plugins
source ~/.vim/vimrc-mappings

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source(
        \ 'file', 'matchers',
        \ ['matcher_default', 'matcher_hide_hidden_files',
        \  'matcher_hide_current_file',
        \  'matcher_project_ignore_files'])


set enc=utf-8
set scroll=5
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:user_emmet_leader_key='`'
let g:user_emmet_expandabbr_key = '`'
let g:UltiSnipsEditSplit = 'vertical'
" riv compatibility with snipmate
let g:riv_i_tab_pum_next = 0
let g:riv_ignored_imaps = "<Tab>"
set laststatus=1
set t_Co=256

let g:paredit_shortmaps = 1
let g:paredit_electric_return = 1
let g:paredit_smartjump = 1
let g:paredit_mode = 1

let g:agprg="ag --column --smart-case -U"

scriptencoding utf-8

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

" show linenumbers
set number

" highlight tabs and trailing spaces
set list listchars=tab:››,eol:¬,trail:·

" GPG Default Receipients
let g:GPGDefaultRecipients=["kolja"]

" Set to auto read when a file is changed from the outside
set autoread

" allow NerdTree to set the Working Directory correctly
let NERDTreeChDirMode=2

augroup file_type
    autocmd!
    " When vimrc is edited, reload it
    autocmd bufwritepost nested vimrc source ~/.vim/vimrc
    " Remove all trailing whitespace before a file is written
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.jeco set ft=html
    autocmd BufNewFile,BufRead *.coffee set ft=coffee
    autocmd BufNewFile,BufRead *.less set ft=css
    autocmd BufNewFile,BufRead *.boot set ft=clojure
augroup end

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
        " candycode, darkburn, dante, redblack,
        " ir_black, jellybeans, cthulhian,
        " darkdesert, darkocean
        colorscheme ir_black
    endif
endfunction

call s:setGuiOptions()

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

function! g:ToggleParedit()
    if g:paredit_mode
        let g:paredit_mode = 0
        echom "ParEdit mode off"
    else
        let g:paredit_mode = 1
        echom "ParEdit mode on"
    endif
endfunction
