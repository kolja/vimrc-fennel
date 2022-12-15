(module mappings
  {require {a aniseed.core
            nvim aniseed.nvim
            telescope telescope
            ls luasnip
            nu aniseed.nvim.util
            pt plug.telescope
            misc plug.misc
            starter mini.starter
            }})

;; in nvim 0.7 this is the way:
;; TODO: rewrite everything against this new API (noremap is true by default now)

(def nmap (partial vim.keymap.set :n))
(def vmap (partial vim.keymap.set :v))
(def imap (partial vim.keymap.set :i))

(vim.keymap.set [:i :s] :<c-k>
                (fn [] (if (ls.expand_or_jumpable) (ls.expand_or_jump)))
                {:silent false})

(vim.keymap.set [:i :s] :<c-j>
                (fn [] (if (ls.jumpable -1) (ls.jump -1)))
                {:silent true})

(vim.keymap.set [:i] :<c-l>
                (fn [] (if (ls.choice_active) (ls.change_choice 1)))
                {:silent true})

(nmap :<leader><leader>s "<cmd>source ~/.vim/lua/plug/luasnip.lua<CR>")

(nmap :<leader>l ":set list!<cr>")

(nmap :<leader>L ":5TermExec cmd=\"lg\" direction=float<cr>")


(nmap :<leader>t #(print (os.date "%H:%M"))
                {:desc "show time in statusline"})

(nmap :<leader>n #(set nvim.wo.number (not nvim.wo.number))
                {:desc "toggle line numbers"})

(vim.api.nvim_create_user_command :Vimrc pt.vimrc {:desc "open Vimrc Files"})

(defn browse-opds [port]
  ((. telescope :extensions :opds :browse)
      {:url (.. "http://synology:" port "/feed.php")
       :raw_preview false
       :open_fn (fn [media]
                   (print (vim.inspect media)))}))

(vim.api.nvim_create_user_command :Opds #(browse-opds "49194")
                                  {:desc "Browse Opds Server: Fiction"})

(vim.api.nvim_create_user_command :OpdsNonfiction #(browse-opds "49196")
                                  {:desc "Browse Opds Server: Nonfiction"})

;; navigate wrapped lines
(nmap :j "gj" {:desc "navigate wrapped lines the same way you navigate non-wrapped lines"})
(nmap :k "gk" {:desc "navigate wrapped lines the same way you navigate non-wrapped lines"})

;; map <option>l to λ
(imap :¬ "<C-K>*l")

;; navigate buffers: cmd-shift-l = ƒ  cmd-shift-h = ∂
(nmap :ƒ "<cmd>bn<cr>")
(nmap :∂ "<cmd>bp<cr>")
(nmap :ƒ "<esc><cmd>bn<cr>")
(nmap :∂ "<esc><cmd>bp<cr>")

(vim.keymap.set :t :ƒ "<C-\\><C-n>:bn<CR>")
(vim.keymap.set :t :∂ "<C-\\><C-n>:bp<CR>")
(vim.keymap.set :t :<esc> "<C-\\><C-n>")

;; create split windows intuitively
(nmap :<C-right> ":set splitright<bar>:vnew<cr>")
(nmap :<C-left>  ":set nosplitright<bar>:vnew<cr>")
(nmap :<C-up>    ":set nosplitbelow<bar>:new<cr>")
(nmap :<C-down>  ":set splitbelow<bar>:new<cr>")

;; smoothly move beteen windows
(nmap :<C-j> "<C-W>j")
(nmap :<C-k> "<C-W>k")
(nmap :<C-h> "<C-W>h")
(nmap :<C-l> "<C-W>l")

(vim.keymap.set :t :<C-j> "<C-\\><C-n><C-W>j")
(vim.keymap.set :t :<C-k> "<C-\\><C-n><C-W>k")
(vim.keymap.set :t :<C-h> "<C-\\><C-n><C-W>h")
(vim.keymap.set :t :<C-l> "<C-\\><C-n><C-W>l")

;; Save and run on the commandline
;; (nmap '<leader>r', ':w<cr> <bar> :!%:p<cr>')

(nmap :<leader>f ":Telescope git_files<cr>")
(nmap :<leader>g ":Telescope live_grep<cr>")
(nmap :<leader>p ":Telescope builtin<cr>")

(nmap :<leader>G ":lua require'gitsigns'.toggle_signs()<cr>")
(nmap :tt ":NnnPicker<cr>")

(nmap :<leader>z misc.toggle-zen-mode)

(nmap :n "nzz")
(nmap :N "Nzz")

;; toggle colorscheme (from vimrc-base)
(nmap :<leader>c misc.toggle-light-dark)

;; visual Block mode
(nmap :<leader>v "v<C-v>")

(nmap :<leader>q ":bd<cr>")

;; search and replace
(nmap :<leader>s ":%s/\\v")
(vmap :<leader>s ":s/\\v")

(nmap :<leader>S starter.open {:silent true})

;; move blocks of text in visual mode
(vmap :<up>   "xkP`[V`]")
(vmap :<down> "xp`[V`]")

;; leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
(nmap :<leader>d ":nohlsearch<cr>:echom ''<cr>" {:silent true})

;; make A and I work in visual mode as they do in visual block mode
(vmap :<C-q> "<esc>\'<<C-q>\'>$")

;; always use 'very magic' regexes
(nmap "/" "/\\v")


;; remove whitespace from line endings, preserver cursor posistion
;; (nmap :<leader><space>, [[:call Preserve("%s/\s\+$//e")<cr>]])

