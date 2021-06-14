source ~/.vim/vimrc-plugins
source ~/.vim/vimrc-mappings
source ~/.vim/vimrc-csharp
source ~/.vim/vimrc-base
source ~/.vim/vimrc-coc
source ~/.vimrc-private

set nolazyredraw

" Custom Silent command that will call redraw
command! -nargs=+ Silent
\   execute 'silent ! <args>'
\ | redraw!

:map <F5> :Silent pdflatex % && open -a Preview && open -a iTerm

let g:vimwiki_list = [{'path': '~/Documents/notes/', 'links_space_char': '_', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_filetypes = ['markdown', 'pandoc']
