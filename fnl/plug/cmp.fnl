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


(vim.cmd "highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080")
(vim.cmd "highlight! CmpItemAbbrMatch guibg=#acecff guifg=#335566")
(vim.cmd "highlight! CmpItemAbbrMatchFuzzy guibg=#8cccee guifg=#335566")
(vim.cmd "highlight! CmpItemKindVariable guibg=#ffbb00 guifg=NONE")
(vim.cmd "highlight! CmpItemKindInterface guibg=#ffbb00 guifg=#555500")
(vim.cmd "highlight! CmpItemKindModule guibg=#3296db guifg=NONE")
(vim.cmd "highlight! CmpItemKindFunction guibg=#dd2233 guifg=NONE")
(vim.cmd "highlight! CmpItemKindMethod guibg=#dd2233 guifg=NONE")
(vim.cmd "highlight! CmpItemKindKeyword guibg=#007788 guifg=NONE")
(vim.cmd "highlight! CmpItemKindField guibg=#ffaa00 guifg=NONE")
(vim.cmd "highlight! CmpItemKindProperty guibg=#ffaa00 guifg=#333300")
(vim.cmd "highlight! CmpItemKindClass guibg=#44bb00 guifg=NONE")
(vim.cmd "highlight! CmpItemKindEnum guibg=#aaaaaa guifg=NONE")
(vim.cmd "highlight! CmpItemKindText guibg=#4444cc guifg=NONE")

(vim.cmd "highlight! Pmenu guifg=#224455 guibg=#569cd6")		;; Popup menu: normal item.
(vim.cmd "highlight! PmenuSel guifg=#226688 guibg=#ffee33")	;; Popup menu: selected item.
(vim.cmd "highlight! PmenuSbar guifg=#123445 guibg=#3333ff") ;; Popup menu: scrollbar.
(vim.cmd "highlight! PmenuThumb guifg=#446677 guibg=NONE"); Popup menu: Thumb of the scrollbar.

