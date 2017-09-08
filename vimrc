
source ~/.vim/vimrc-plugins
source ~/.vim/vimrc-mappings

let g:clj_fmt_config_dir = '.lein/profiles.clj'
let g:python3_host_prog = '/usr/local/bin/python3'

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction
" ----------------------------------------------------------------
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" feed Ag into fzf
command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '40%', 'options': --no-color'})

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source(
        \ 'file', 'matchers',
        \ ['matcher_default', 'matcher_hide_hidden_files',
        \  'matcher_hide_current_file',
        \  'matcher_project_ignore_files'])

set enc=utf-8
set scroll=5
set scrolloff=7

let g:UltiSnipsUsePythonVersion = 3
"------------------------------------- deoplete --------------------------------
"
set runtimepath+=~/.vim/bundle/deoplete.nvim/
let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'
let g:deoplete#enable_smart_case = 1

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-j> deoplete#mappings#smart_close_popup()
inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:user_emmet_leader_key='`'
" let g:user_emmet_expandabbr_key = '`'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger="`"
let g:UltiSnipsJumpForwardTrigger="`"
let g:UltiSnipsJumpBackwardTrigger="~"

" nvim specific config
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set laststatus=1
set t_Co=256

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
"set cryptmethod=blowfish

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

command! Figwheel :Piggieback! (do (require 'figwheel-sidecar.repl-api) (figwheel-sidecar.repl-api/cljs-repl))

augroup file_type
    autocmd!
    " When vimrc is edited, reload it
    autocmd bufwritepost nested vimrc source ~/.vim/vimrc
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.coffee set ft=coffee
    autocmd BufNewFile,BufRead *.less,*.scss,*.styl set ft=css
    autocmd BufNewFile,BufRead *.boot,*.cljs,*.edn set ft=clojure
augroup end

function! s:setGuiOptions()
        syntax on
        set guioptions=-t " don't show the menu
        set guioptions=+R " show scrollbar
        set hlsearch
        set ch=2          " Make command line two lines high
        set mousehide     " Hide the mouse when typing text
        set guifont=Meslo\ LG\ M\ for\ Powerline:h13
        set background=dark
        let g:solarized_visibility = "high"
        let g:solarized_contrast = "high"
        let g:solarized_termcolors = 256
        let g:solarized_termtrans = 1
        " my favourites (dark):
        " candycode, darkburn, dante, redblack, antares
        " ir_black, jellybeans, cthulhian,
        " darkdesert, solarized
        " (light)
        " simpleandfriendly
        colorscheme solarized
endfunction

call s:setGuiOptions()

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction


let g:darkColorScheme=1
function! ToggleLightDarkColorscheme()
    if g:darkColorScheme
        colorscheme pencil " moria
        set background=light
        let g:darkColorScheme=0
    else
        colorscheme solarized " lucid, znake, gruvbox
        set background=dark
        let g:darkColorScheme=1
    endif
endfunction

nnoremap <leader>c :call ToggleLightDarkColorscheme()<cr>

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
