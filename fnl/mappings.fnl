(module mappings
  {require {a aniseed.core
            nvim aniseed.nvim
            telescope telescope
            nu aniseed.nvim.util}})

;; in nvim 0.7 this is the way:
;; TODO: rewrite everything against this new API (noremap is true by default now)
(vim.keymap.set :n :<leader>r (fn [] (print "foo")))

(defn- nmap [from to] (nvim.set_keymap :n from to {:noremap true :silent true}))
(defn- imap [from to] (nvim.set_keymap :i from to {:noremap true :silent true}))
(defn- vmap [from to] (nvim.set_keymap :v from to {:noremap true :silent true}))
(defn- tmap [from to] (nvim.set_keymap :t from to {:noremap true :silent true}))


(nu.fn-bridge :Time            :mappings         :show-time)
(nu.fn-bridge :ToggleNum       :mappings         :toggle-number)
(nu.fn-bridge :BrowseOpds      :mappings         :browse-opds)
(nu.fn-bridge :ToggleZenMode   :plug.misc        :toggle-zen-mode)
(nu.fn-bridge :Vimrc           :plug.telescope   :vimrc)
(nu.fn-bridge :ToggleLightDark :plug.misc        :toggle-light-dark)

(defn show-time []
   (a.println (os.date "%H:%M")))

(defn toggle-number []
    (set nvim.wo.number (not nvim.wo.number)))

(nvim.ex.command :Vimrc ":call Vimrc()")
(nmap :<leader>t ":call Time()<cr>")
(nmap :<leader>n ":call ToggleNum()<cr>")

(nmap :<leader>k ":call BrowseOpds()<cr>")

(defn browse-opds []
  ((. telescope :extensions :opds :browse) 
      {:url "http://192.168.3.42:49194/feed.php"
       :raw_preview false
       :open_fn (fn [media] 
                   (print (vim.inspect media))
                   )}))

;; navigate wrapped lines the same way you navigate non-wrapped lines
(nmap :j "gj")
(nmap :k "gk")

;; map <option>l to λ
(imap :¬ "<C-K>*l")

;; navigate buffers: cmd-shift-l = ƒ  cmd-shift-h = ∂
(nmap :ƒ "<cmd>bn<cr>")
(nmap :∂ "<cmd>bp<cr>")
(imap :ƒ "<esc><cmd>bn<cr>")
(imap :∂ "<esc><cmd>bp<cr>")

(tmap :ƒ "<C-\\><C-n>:bn<CR>")
(tmap :∂ "<C-\\><C-n>:bp<CR>")
(tmap :<esc> "<C-\\><C-n>")

;; create split windows intuitively
(nmap "<C-right>" ":set splitright<bar>:vnew<cr>")
(nmap "<C-left>"  ":set nosplitright<bar>:vnew<cr>")
(nmap "<C-up>"    ":set nosplitbelow<bar>:new<cr>")
(nmap "<C-down>"  ":set splitbelow<bar>:new<cr>")

;; Smart way to move beteen windows
(nmap :<C-j> "<C-W>j")
(nmap :<C-k> "<C-W>k")
(nmap :<C-h> "<C-W>h")
(nmap :<C-l> "<C-W>l")

(tmap :<C-j> "<C-\\><C-n><C-W>j")
(tmap :<C-k> "<C-\\><C-n><C-W>k")
(tmap :<C-h> "<C-\\><C-n><C-W>h")
(tmap :<C-l> "<C-\\><C-n><C-W>l")

;; Save and run on the commandline
;; (nmap '<leader>r', ':w<cr> <bar> :!%:p<cr>')

(nmap :<leader>f ":Telescope git_files<cr>")
(nmap :<leader>g ":Telescope live_grep<cr>")
(nmap :<leader>p ":Telescope builtin<cr>")

(nmap :<leader>G ":lua require'gitsigns'.toggle_signs()<cr>")
(nmap :tt ":NnnPicker<cr>")

(nmap :<leader>z ":call ToggleZenMode()<cr>")

(nmap :n "nzz")
(nmap :N "Nzz")

;; toggle colorscheme (from vimrc-base)
(nmap :<leader>c ":call ToggleLightDark()<cr>")

;; (nmap :<Leader>= ":OmniSharpCodeFormat<cr>") ;; <leader> =

;; visual Block mode
(nmap :<leader>v "v<C-v>")

(nmap :<leader>q ":bd<cr>")

;; Fast editing of Snippets
(nmap :<leader>ue ":UltiSnipsEdit<cr>")

;; search and replace
(nvim.set_keymap :n :<leader>s ":%s/\\v" {:noremap true})
(nvim.set_keymap :v :<leader>s ":s/\\v" {:noremap true})

(nmap :<leader>S ":Startify<cr>")

;; move blocks of text in visual mode
(vmap :<up>   "xkP`[V`]")
(vmap :<down> "xp`[V`]")

;; leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
(nmap :<leader>d ":nohlsearch<cr>:echom ''<cr>")

;; make A and I work in visual mode as they do in visual block mode
(vmap :<C-q> "<esc>\'<<C-q>\'>$")

;; always use 'very magic' regexes
(nvim.set_keymap :n "/" "/\\v" {:noremap true})

;; fix indentation after splice
(nmap :<leader>o "o==")

(nmap :<leader>l ":set list!<cr>")

(nmap :<leader>L ":LazyGit<cr>")

;; remove whitespace from line endings, preserver cursor posistion
;; (nmap :<leader><space>, [[:call Preserve("%s/\s\+$//e")<cr>]])

;; check todo item
(nmap :<leader>x ":call ToggleDone()<cr>")

