
(module plugins.telescope
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util}})

(vim.schedule
  (fn []
    (local telescope (require :telescope))
    (telescope.setup {:defaults {:preview_cutoff 10}})))

(defn vimrc []
  (let [builtin (require "telescope.builtin")]
    (builtin.find_files {;; file_browser, live_grep, git_files    
      :prompt_title         "Vimrc Config"
      :file_ignore_patterns ["UltiSnips/*.*"]
      :cwd                  "~/.vim"})))

