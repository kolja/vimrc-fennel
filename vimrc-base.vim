
let g:clj_fmt_config_dir = '.lein/profiles.clj'

let g:python_host_prog = '/Users/kolja/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/kolja/.pyenv/versions/neovim3/bin/python'
let g:python2_host_prog = '/Users/kolja/.pyenv/versions/neovim2/bin/python'

let g:conjure#client#fennel#aniseed#aniseed_module_prefix = "aniseed."

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END

let g:nnn#set_default_mappings = 0

" ---------------------------- autocompletion -----------------------------

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" ---------------------------- Vimwiki ------------------------------------

let g:vimwiki_list = [{'path': '~/Documents/notes/', 'links_space_char': '_', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_filetypes = ['markdown', 'pandoc']

" ---------------------------- Starify ------------------------------------
"
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
" ---------------------------- Repl Alliance ------------------------------------
"
autocmd FileType clojure lua repl = require("srepl"):connect()

let g:replPort = 3449
let g:replHost = "127.0.0.1"
let g:replNamespace = "user"
let g:replProtocol = "srepl"
let g:replVirtual = 1000
let g:replElision = "●"

" ----------------------------------------------------------------
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

let g:ale_sign_error = '►'
let g:ale_sign_warning = '▲'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

set enc=utf-8
set scroll=5
set scrolloff=7

let g:nnn#layout = { 'window': { 'width': 0.8, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#command = 'NNN_OPTS="" nnn -R'

let g:gitgutter_override_sign_column_highlight = 0

"------------------------------------- vimtex   ---------------------------------

let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
let g:vimtex_compiler_engine = 'xelatex'

let g:vimtex_compiler_latexmk = {
    \ 'executable' : 'latexmk',
    \ 'build_dir' : './build',
    \ 'options' : [
    \   '-xelatex',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode']}

function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
endfunction

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
let g:vimtex_compiler_progname = 'nvr'

"------------------------------------- prettier ---------------------------------

let g:prettier#config#bracket_spacing = 'true'

"------------------------------------- neomake ---------------------------------

let g:neomake_javascript_eslint_exe = '/usr/local/bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_error_sign = {'text': '✕', 'texthl': 'NeomakeErrorSign'}
let g:neomake_message_sign = {'text': '➤','texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ','texthl': 'NeomakeInfoSign'}
autocmd! BufWritePost * Neomake

augroup my_neomake_signs
    au!
    autocmd ColorScheme *
        \ hi NeomakeErrorSign ctermfg=red |
        \ hi NeomakeWarningSign ctermfg=yellow |
        \ hi NeomakeMessageSign ctermfg=blue |
        \ hi NeomakeInfoSign ctermfg=green
augroup END

"------------------------------------- Ultisnips --------------------------------

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:user_emmet_expandabbr_key = '`'

let g:highlightedyank_highlight_duration = 500

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set laststatus=1

let g:ag_prg="ag --column --smart-case -U"

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

set colorcolumn=81

" don't use swapfiles. Use git instead
set nobackup
set nowritebackup
set noswapfile
set hlsearch

" allways use OSX's clipboard
set clipboard=unnamed

" Sets how many lines of history VIM has to remember
set history=1000
set nofoldenable

" show linenumbers
set number

" highlight tabs and trailing spaces
set list listchars=tab:››,eol:¬,trail:·
set nolist

" Set to auto read when a file is changed from the outside
set autoread

set termguicolors
set t_Co=256

" hilight search/replace
set inccommand=nosplit

set nolazyredraw

" Custom Silent command that will call redraw
command! -nargs=+ Silent
\   execute 'silent ! <args>'
\ | redraw!

augroup file_type
    autocmd!
    " When vimrc is edited, reload it
    autocmd bufwritepost nested vimrc source ~/.vim/vimrc
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.coffee set ft=coffee
    autocmd BufNewFile,BufRead *.less,*.scss,*.styl set ft=css
    autocmd BufNewFile,BufRead *.boot,*.cljs,*.edn set ft=clojure
    autocmd BufNewFile,BufRead *.jl set ft=julia
    autocmd BufNewFile,BufRead *.md setlocal textwidth=80
augroup end
syntax on
set guioptions=-t " don't show the menu
set guioptions=+R " show scrollbar
"set ch=2          " Make command line two lines high
set mousehide     " Hide the mouse when typing text
set guifont=FiraCode-Regular:h11
set background=dark

colorscheme NeoSolarized

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

let g:darkColorScheme=1
function! ToggleLightDarkColorscheme()
    if g:darkColorScheme
        set background=light
        let g:darkColorScheme=0
    else
        set background=dark
        let g:darkColorScheme=1
        lua require('feline').reset_highlights()
    endif
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

" check/uncheck Todo-Items that look like this:
" [ ] mow the lawn
function! ToggleDone()
    if search('\[x\]', 'bcn', line("."))
        call Preserve('.s/\[x\]/\[ \]/')
    elseif search('\[ \]', 'bcn', line("."))
        call Preserve('.s/\[\s\]/\[x\]/')
    endif
endfunction


