(module plug.statusline {require {nvim aniseed.nvim
                                  lualine lualine
                                  ;; solarized lualine.themes.solarized_dark
                                  ;; gruvbox lualine.themes.gruvbox
                                  }})

;; More themes: https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
(local colors {
  :darker   "#00242D"
  :lighter  "#073642"
  :bluegray "#4E7983"
  :dred     "#760C02"
  :red      "#A01700"
  :dyellow  "#7b5000"
  :yellow   "#ad7200"
  :dblue    "#002b36"
  :blue     "#005C73"
  :dgreen   "#586400"
  :green    "#9CAE00"
})

(local theme {
  :normal {
    :a {:fg (. colors :dblue)    :bg (. colors :blue) :gui "bold"}
    :b {:fg (. colors :dblue)    :bg (. colors :bluegray)}
    :c {:fg (. colors :bluegray) :bg (. colors :darker)}}
  :insert  {:a {:fg (. colors :dgreen)  :bg (. colors :green)  :gui "bold"}}
  :visual  {:a {:fg (. colors :dyellow) :bg (. colors :yellow) :gui "bold"}}
  :replace {:a {:fg (. colors :dred)    :bg (. colors :red)    :gui "bold"}}
  :inactive {
    :a {:fg (. colors :bluegray)   :bg (. colors :darker) :gui "bold" }
    :b {:fg (. colors :dblue)   :bg (. colors :bluegray)}
    :c {:fg (. colors :bluegray)  :bg (. colors :darker)}}})

(lualine.setup {
                :options {
                          :section_separators ""
                          :component_separators "" 
                          :theme theme ;;gruvbox / solarized
                          :globalstatus true
                          }
                :sections {
                           :lualine_a [{1 :mode :fmt (fn [str] (str:sub 1 1))}]
                           :lualine_b [{1 :filename}]
                           :lualine_c [{1 :branch}]
                           :lualine_d [{1 :diagnostics  :sources {1 :nvim_lsp}}]
                           :lualine_x [{1 :encoding 2 :fileformat 3 :filetype}]
                           :lualine_y [{1 :progress}]
                           :lualine_z [{1 :location}]}})
