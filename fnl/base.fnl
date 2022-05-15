(module base
  {require {nvim aniseed.nvim}})

(set nvim.g.mapleader ",")
(set nvim.g.maplocalleader "\\")

(set nvim.o.laststatus 2)
(set nvim.o.termguicolors true)

(set nvim.o.incsearch true)
(set nvim.o.hidden true)

(set nvim.o.tabstop 4)
(set nvim.o.softtabstop 4)
(set nvim.o.shiftwidth 4)
(set nvim.o.smarttab true)
(set nvim.o.expandtab true)
(set nvim.o.autoindent true)

(set nvim.o.pumblend 20) ;; make pop-up-menu transparent

(set nvim.o.colorcolumn "81") ;; reminder when line gets too long

(set nvim.o.enc "utf-8")
(set nvim.o.scroll 5)
(set nvim.o.scrolloff 7)

;; don't use swapfiles. Use git instead
(set nvim.o.backup false)
(set nvim.o.writebackup false)
(set nvim.o.swapfile false)

(set nvim.o.hlsearch true)

;; allways use OSX's clipboard
(set nvim.o.clipboard "unnamed")

;; Sets how many lines of history VIM has to remember
(set nvim.o.history 1000)
(set nvim.o.foldenable false)

;; show linenumbers
(set nvim.o.number true)

;; highlight tabs and trailing spaces
(nvim.ex.set "listchars=tab:››,eol:¬,trail:·")
(set nvim.o.list false)

;; Set to auto read when a file is changed from the outside
(set nvim.o.autoread true)

;; preview search/replace -- neovim only
(set nvim.o.inccommand "nosplit")

(set nvim.o.lazyredraw false)

(set nvim.o.showmode false)

(nvim.command ":syntax on")

(set nvim.o.guifont "FiraCode-Regular:h11")
(set nvim.o.background "dark")

(nvim.command ":colorscheme NeoSolarized")


;; set shortmess+=c
;; highlight link CompeDocumentation NormalFloat
;; 
;; "------------------------------------- Autocommands --------------------------------
;; 
;; " autocmd FileType clojure lua repl = require("srepl"):connect()
;; 
;; augroup highlight_yank
;;     autocmd!
;;     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
;; augroup END
