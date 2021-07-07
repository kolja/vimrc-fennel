(module plug.statusline {require {nvim aniseed.nvim
                                  feline feline
                                  lsp feline.providers.lsp
                                  vi_mode_utils feline.providers.vi_mode}})

(local colors {
   :bg         :#012028
   :fg         :none
   :yellow     :#B4881D
   :cyan       :#32A198
   :darkblue   :#022B35
   :green      :#729D1F
   :orange     :#C94C22
   :violet     :#8F3982
   :magenta    :#ff80ff
   :blue       :#2E8CCF
   :red        :#DA3435
})

(local vi_mode_colors {
   :NORMAL    (. colors :green)
   :INSERT    (. colors :red)
   :VISUAL    (. colors :yellow)
   :OP        (. colors :green)
   :BLOCK     (. colors :blue)
   :REPLACE   (. colors :violet)
   :V-REPLACE (. colors :violet)
   :ENTER     (. colors :cyan)
   :MORE      (. colors :cyan)
   :SELECT    (. colors :orange)
   :COMMAND   (. colors :green)
   :SHELL     (. colors :green)
   :TERM      (. colors :green)
   :NONE      (. colors :yellow)
})

(defn file_osinfo []
  (let [os (vim.bo.fileformat:upper)]
     (if (= os :UNIX) " "
         (= os :MAC)  " "
                      " ")))

(defn diagnostics [key]
  (let [
    bufnr  (vim.api.nvim_get_current_buf)
    counts (vim.fn.ale#statusline#Count bufnr)
    diag   {:errors    (+ (. counts :error) (. counts :style_error))
            :warnings  (+ (. counts :warning) (. counts :style_warning))
            :infos     (. counts :info)}]
  (. diag key)))

(local comps {
    :vi_mode {
        :left {
            :provider "███"
            :hl (fn []
                {:name (vi_mode_utils.get_mode_highlight_name)
                 :fg   (vi_mode_utils.get_mode_color)})
            :right_sep  " "}}
    :file {
        :info {
            :provider "file_info"
            :hl {
                :fg (. colors :blue)
                :style "bold"}}
        :encoding {
            :provider "file_encoding"
            :left_sep " "
            :hl {
                :fg (. colors :violet)
                :style "bold"}}
        :type {:provider "file_type"}
        :os {
            :provider file_osinfo
            :left_sep " "
            :hl {
                :fg (. colors :violet)
                :style "bold"}}}
    :line_percentage {
        :provider "line_percentage"
        :left_sep " "
        :hl {:style "bold"}}
    :scroll_bar {
        :provider "scroll_bar"
        :left_sep " "
        :hl {
            :fg (. colors :blue)
            :style "bold"}}
    :diagnos {
        :err {
            :provider (fn [] (.. " " (diagnostics :errors)))
            :left_sep " "
            :enabled (fn [] (> (diagnostics :errors) 0))
            :hl {:fg (. colors :red)}}
        :warn {
            :provider (fn [] 
                (.. " "  (diagnostics :warnings)))
            :left_sep " "
            :enabled (fn [] (> (diagnostics :warnings) 0))
            :hl {:fg (. colors :yellow)}}
        :info {
            :provider (fn [] (.. " " (diagnostics :infos)))
            :left_sep " "
            :enabled (fn [] (> (diagnostics :infos) 0))
            :hl {:fg (. colors :blue)}}
        :hint {
            :provider "diagnostic_hints"
            :enabled (fn [] ((. lsp :diagnostics_exist) :Hint))
            :hl {:fg (. colors :cyan)}}}
    :lsp {
        :name {
            :provider "lsp_client_names"
            :left_sep " "
            :icon " "
            :hl {:fg (. colors :yellow)}}}
    :git {
        :branch {
            :provider "git_branch"
            :icon " "
            :left_sep " "
            :hl {
                :fg (. colors :violet)
                :style "bold"}}
        :add {
            :provider "git_diff_added"
            :hl {:fg (. colors :green)}}
        :change {
            :provider "git_diff_changed"
            :hl {:fg (. colors :orange)}}
        :remove {
            :provider "git_diff_removed"
            :hl {:fg (. colors :red)}}}})

(local properties {
    :force_inactive {
        :filetypes [:NvimTree :dbui :packer :startify :fugitive :fugitiveblame]
        :buftypes  [:terminal :packer :startify]
        :bufnames  [:startify]}})

(local components {
    :left {
        :active [            
            (. comps :vi_mode :left)
            (. comps :file    :info)
            (. comps :lsp     :name)
            (. comps :diagnos :err)
            (. comps :diagnos :warn)
            (. comps :diagnos :hint)
            (. comps :diagnos :info)]
        :inactive [
            (. comps :vi_mode :left)
            (. comps :file    :info)]}

    :mid {:active [] :inactive []}

    :right {
        :active [
            (. comps :git     :add)
            (. comps :git     :change)
            (. comps :git     :remove)
            (. comps :file    :os)
            (. comps :git     :branch)
            (. comps :line_percentage)
            (. comps :scroll_bar)
            (. comps :vi_mode :right)]
        :inactive []}})

(feline.setup {
    :default_bg     (. colors :bg)
    :default_fg     (. colors :fg)
    :components     components
    :properties     properties
    :vi_mode_colors vi_mode_colors})

