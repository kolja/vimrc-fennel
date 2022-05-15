(module plug.luasnip
  {require {nvim aniseed.nvim
            ls luasnip
            sn luasnip.loaders.from_lua}})

;; (sn.load {:paths "~/.vim/snippets"})
(sn.lazy_load {:paths "~/.vim/lua/snippets"})

(ls.config.set_config {
  :updateevnts "TextChanged,TextChangedI"
  :enable_autosnippets true})

