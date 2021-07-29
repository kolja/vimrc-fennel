
set termguicolors
let g:aniseed#env = v:true

set shortmess+=c
highlight link CompeDocumentation NormalFloat

"------------------------------------- Autocommands --------------------------------

" autocmd FileType clojure lua repl = require("srepl"):connect()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
augroup END

