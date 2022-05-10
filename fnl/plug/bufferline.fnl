(module plug.bufferline {require {nvim aniseed.nvim}})

(vim.schedule
  (fn []
    (local bufferline (require :bufferline))
    (bufferline.setup {:options
                       {:numbers :none ;; :none :ordinal :buffer_id :both
                        :show_buffer_close_icons false
                        :show_close_icon false
                        :separator_style :thin ;; :thick :slant { :any :any }
                        :enforce_regular_tabs true
                        :always_show_bufferline false}})))
