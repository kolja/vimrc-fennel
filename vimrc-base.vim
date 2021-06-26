
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

"------------------------------------- Autocommands --------------------------------

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END

augroup file_type
    autocmd!
    " When vimrc is edited, reload it
    autocmd bufwritepost nested vimrc source ~/.vim/vimrc
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.less,*.scss,*.styl set ft=css
    autocmd BufNewFile,BufRead *.boot,*.cljs,*.edn set ft=clojure
    autocmd BufNewFile,BufRead *.jl set ft=julia
    autocmd BufNewFile,BufRead *.md setlocal textwidth=80
augroup end
