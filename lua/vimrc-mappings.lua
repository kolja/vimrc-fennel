

" ------------------- Key mappings
"
let mapleader = ","
let maplocalleader = ","

command Epub :%s!\v(.*)\sby\s(.*)\s\(z-lib.org\)!\2 - \1!

command Time :echom system("date '+\%H:\%M' | tr -d '\n'")
nnoremap <leader>t :Time<CR>

" , used to have this 'backwards to character' functionality. Use '\' for this instead.
nnoremap \ ,

" navigate buffers with ease
" note: this requires system-level config, mapping cmd-hjkl to
" cmd-<arrow-keys>)

" navigate wrapped lines the same way you navigate non-wrapped lines
nnoremap j gj
nnoremap k gk

" map <option>l to λ
inoremap ¬ <C-K>*l 

nnoremap ƒ :bn<CR>
nnoremap ∂ :bp<CR>
inoremap ƒ <ESC>:bn<CR>
inoremap ∂ <ESC>:bp<CR>
if has('nvim')
    tnoremap ƒ <C-\><C-n>:bn<CR>
    tnoremap ∂ <C-\><C-n>:bp<CR>
    tnoremap <ESC> <C-\><C-n>
endif

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" create split windows intuitively
nnoremap <C-right> :set splitright<CR>:vnew<CR>
nnoremap <C-left> :set nosplitright<CR>:vnew<CR>
nnoremap <C-up> :set nosplitbelow<CR>:new<CR>
nnoremap <C-down> :set splitbelow<CR>:new<CR>

" Smart way to move beteen windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
if has('nvim')
    tnoremap <C-j> <C-\><C-n><C-W>j
    tnoremap <C-k> <C-\><C-n><C-W>k
    tnoremap <C-h> <C-\><C-n><C-W>h
    tnoremap <C-l> <C-\><C-n><C-W>l
endif


" reload chrome from within vim
" nnoremap <leader>r :!/usr/local/bin/chromereload.sh<cr><cr>
nmap ? <Plug>DashSearch
nnoremap <leader>r :w<cr> <bar> :!%:p<cr>

"nnoremap <leader>f :Files<CR>
"nnoremap <leader>g :Rg<CR>
"
"nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope git_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>p :lua require'telescope.builtin'.builtin{}<cr>

nnoremap <leader>G :GitGutterToggle<CR>
nnoremap <silent> tt :NnnPicker<CR>

nnoremap <silent><leader>z :call ToggleZenMode()<CR>

nnoremap n nzz
nnoremap N Nzz

" toggle colorscheme (from vimrc-base)
nnoremap <leader>c :call ToggleLightDarkColorscheme()<cr>

" visual Block mode
nnoremap <leader>v v<C-v>

" was using :Bdelete (from bbye plugin) before
nnoremap <leader>q :bd<cr>

" Fast editing of the .vimrc
" nnoremap <leader>e :e! ~/.vim/vimrc<cr>
command Vimrc :e! ~/.vim/vimrc

" Fast editing of Snippets
nnoremap <leader>ue :UltiSnipsEdit<CR>
nnoremap <leader>, /<C-r><C-w>.*function/<CR>zt3<C-Y>

" search and replace
nnoremap <leader>s :%s/\v

" move blocks of text in visual mode
vnoremap <up> xkP`[V`]
vnoremap <down> xp`[V`]

" leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
noremap <leader>d :nohlsearch<CR>
noremap <leader>h <ctrl-w>

" make A and I work in visual mode as they do in visual block mode
vnoremap <C-q> <esc>'<<C-q>'>$

" always use 'very magic' regexes
nnoremap / /\v

" fix indentation after splice
nnoremap <leader>o <leader>o==

nnoremap <leader>l :set list!<CR>
nnoremap <leader>L :LazyGit<CR>

" run in node
nnoremap <leader>n :!node %<CR>

" remove whitespace from line endings, preserver cursor posistion
vnoremap <leader><space> :call Preserve("'<,'>s/\\s\\+$//e")<CR>
nnoremap <leader><space> :call Preserve("%s/\\s\\+$//e")<CR>
nnoremap <leader>u :call Preserve("Gread -")<CR>

" check todo item
nnoremap <leader>x :call ToggleDone()<CR>

" --------------------- From Drews vimrc:
" Visual line repeat
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

