(module plug.cmp
  {require {nvim aniseed.nvim
            ;; nu aniseed.nvim.util
            cmp cmp
            luasnip luasnip
            lspkind lspkind
            cmp_nvim_lsp cmp_nvim_lsp
            lspconfig lspconfig
            }})

(lspkind.init)
(cmp.setup {

    :experimental {
      :native_menu false
      :ghost_text true}

    :snippet {
      ;; REQUIRED - you must specify a snippet engine
      :expand (fn [args] (luasnip.lsp_expand (. args body)))}

    ;; :window {
    ;;   :completion (cmp.config.window.bordered)
    ;;   :documentation (cmp.config.window.bordered)}

    :mapping (cmp.mapping.preset.insert {
      :<C-n> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert })
      :<C-p> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert })
      :<C-b> (cmp.mapping.scroll_docs -4)
      :<C-f> (cmp.mapping.scroll_docs 4)
      :<C-Space> (cmp.mapping.complete)
      :<C-e> (cmp.mapping.abort)

      ;; Accept currently selected item. 
      ;; Set `select` to `false` to only confirm explicitly selected items.
      :<CR> (cmp.mapping.confirm {:select true}) 
    })

    :sources (cmp.config.sources [{:name "nvim_lsp"}
                                  {:name "luasnip" }] 
                                 [{:name "buffer"}])
    :formatting {
      :format (lspkind.cmp_format {
          :with_text true
          :menu {
              :buffer "[buf]"
              :nvim_lsp "[lsp]"
              :api  "[api]"
              :path "[path]"
              :luasnip "[snip]"
         }})
     }
})

;; Set configuration for specific filetype.
;;(cmp.setup.filetype "gitcommit" {
;;    :sources (cmp.config.sources {
;;      {:name "cmp_git"} ;; You can specify the `cmp_git` source if you were installed it.
;;    } {
;;      {:name "buffer"}
;;    })
;;})

;; Use buffer source for "/" (if you enabled "native_menu", this won't work anymore).
;; (cmp.setup.cmdline "/" {
;;   :mapping (cmp.mapping.preset.cmdline)
;;   sources [{:name "buffer" }]
;; })

;; Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
;;(cmp.setup.cmdline ':' {
;;  :mapping (cmp.mapping.preset.cmdline)
;;  :sources (cmp.config.sources 
;;      [{ :name = 'path' }] 
;;      [{ :name = 'cmdline'}])})

;; Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
((. (. lspconfig "omnisharp") "setup") {
  :capabilities (cmp_nvim_lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
})

