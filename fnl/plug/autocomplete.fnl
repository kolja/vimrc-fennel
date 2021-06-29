(module plug.autocomplete
  {require {a aniseed.core
            nvim aniseed.nvim}})

;; TODO: implement these:
;;(defn- split [delim str] 
;;  (string.gmatch str (.. "([^-]+)")))

;; (defn- join [ch str])

;; (defn- set+ [optstr opt]
;;   (let [opts (split "," opts)]
;;    (join "," (table.insert opts opt))))

(set nvim.g.completion_matching_strategy_list [:exact :substring :fuzzy])
(set nvim.g.completion_enable_snippet :UltiSnips)

;; Set completeopt to have a better completion experience
;; (set nvim.o.completeopt "longest,menuone,preview"])
(set nvim.o.completeopt "menuone,noinsert,noselect")

;; Avoid showing extra message when using completion
(set nvim.o.shortmess :c)

;; Use <Tab> and <S-Tab> to navigate through popup menu
(nvim.set_keymap :i :<Tab> ":pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"" {:noremap true :expr true})
(nvim.set_keymap :i :<S-Tab> ":pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"" {:noremap true :expr true})

(nvim.set_keymap :i :<tab> "<Plug>(completion_smart_tab)" {})
(nvim.set_keymap :i :<s-tab> "<Plug>(completion_smart_s_tab)" {})

