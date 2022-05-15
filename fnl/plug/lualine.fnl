(module plug.statusline {require {nvim aniseed.nvim
                                  lualine lualine
                                  solarized lualine.themes.solarized_dark
                                  }})

;; More themes: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
(lualine.setup {
                :options {
                          :theme solarized}
                :sections {
                           :lualine_a [{1 :mode}]
                           :lualine_b [{1 :filename}]
                           :lualine_c [{1 :branch}]
                           :lualine_d [{1 :diagnostics  :sources {1 :nvim_lsp}}]
                           :lualine_x [{1 :encoding 2 :fileformat 3 :filetype}]
                           :lualine_y [{1 :progress}]
                           :lualine_z [{1 :location}]}})
