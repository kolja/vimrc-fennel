(module plugins.misc
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            feline feline}})

(set nvim.g.nnn#set_default_mappings 0)
(set nvim.g.nnn#layout {:window {:width 0.8 :height 0.6 :highlight :Debug}})
(set nvim.g.nnn#command "NNN_OPTS=\"\" nnn -R")

(set nvim.g.clj_fmt_config_dir ".lein/profiles.clj")

(set nvim.g.conjure#client#fennel#aniseed#aniseed_module_prefix "aniseed.")

(set nvim.g.gitgutter_override_sign_column_highlight 0)

(set nvim.g.ale_linters {:cs [:OmniSharp]})

(set nvim.g.user_emmet_expandabbr_key "`")

(vim.schedule
  (fn []
    (local colorizer (require :colorizer))
    (colorizer.setup)))

(defn toggle-zen-mode []
  (let [zen-mode-on (fn []
                      (set nvim.wo.number false)
                      (nvim.command ":GitGutterDisable")
                      (set nvim.o.showtabline 0)
                      (set nvim.o.laststatus 0)
                      (set nvim.o.colorcolumn "0")
                      (set nvim.o.ruler false)
                      (set nvim.o.showcmd false)
                      (nvim.command ":hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")
                      (set nvim.g.zenMode true))
        zen-mode-off (fn []
                       (set nvim.wo.number true)
                       (nvim.command ":GitGutterEnable")
                       (set nvim.o.showtabline 2)
                       (set nvim.o.laststatus 2)
                       (set nvim.o.colorcolumn "80")
                       (set nvim.o.ruler true)
                       (set nvim.o.showcmd true)
                       (nvim.command ":hi! EndOfBuffer ctermbg=bg ctermfg=fg guibg=bg guifg=fg")
                       (set nvim.g.zenMode false))]
    (if nvim.g.zenMode (zen-mode-off) (zen-mode-on))))

;; function! ExecuteMacroOverVisualRange()
;;     echo "@".getcmdline()
;;     execute ":'<,'>normal @".nr2char(getchar())
;; endfunction

(set nvim.g.dark true)
(defn toggle-light-dark []
  "toggle light/dark colorscheme"
  (let [go-light (fn []
                   (set nvim.g.dark false)
                   (set nvim.o.background :light))
        go-dark (fn []
                  (set nvim.g.dark true)
                  (set nvim.o.background :dark)
                  (feline.reset_highlights))]
    (if nvim.g.dark (go-light) (go-dark))))

;; 
;; " Strip trailing whitespace
;; function! Preserve(command)
;;     " Preparation: save last search, and cursor position.
;;     let _s=@/
;;     let l = line(".")
;;     let c = col(".")
;;     " Do the business:
;;     execute a:command
;;     " Clean up: restore previous search history, and cursor position
;;     let @/=_s
;;     call cursor(l, c)
;; endfunction
;; 
;; " check/uncheck Todo-Items that look like this:
;; " [ ] mow the lawn
;; function! ToggleDone()
;;     if search('\[x\]', 'bcn', line("."))
;;         call Preserve('.s/\[x\]/\[ \]/')
;;     elseif search('\[ \]', 'bcn', line("."))
;;         call Preserve('.s/\[\s\]/\[x\]/')
;;     endif
;; endfunction

