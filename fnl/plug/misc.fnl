(module plug.misc
  {require {nvim aniseed.nvim
            nu aniseed.nvim.util
            gitsigns gitsigns
            Comment Comment
            autopairs nvim-autopairs
            nnn nnn
            }})

(Comment.setup)

(fn exit-nnn [] "override <esc> in nnn")

(nnn.setup {
           :command "NNN_OPTS=\"\" nnn -R"
           :set_default_mappings false
           :statusline false
           :layout {:window {:width 0.8 :height 0.6 :highlight :Debug}}
           :action { :<esc> exit-nnn }
           })

(set nvim.g.clj_fmt_config_dir ".lein/profiles.clj")

;; (set nvim.g.conjure#client#fennel#aniseed#aniseed_module_prefix "aniseed.")

(set nvim.g.gitgutter_override_sign_column_highlight 0)

(set nvim.g.ale_linters {:cs [:OmniSharp]})
(set nvim.g.ale_sign_error "►")
(set nvim.g.ale_sign_warning "▲")

(set nvim.g.sexp_filetypes "clojure,scheme,lisp,fennel,racket")

(nvim.ex.highlight :ALEErrorSign :ctermbg=NONE :ctermfg=red)
(nvim.ex.highlight :ALEWarningSign :ctermbg=NONE :ctermfg=yellow)

(set nvim.g.user_emmet_expandabbr_key "`")

(autopairs.setup)
(gitsigns.setup)

(vim.schedule
  (fn []
    (local colorizer (require :colorizer))
    (colorizer.setup)))

(def toggle-zen-mode (fn []
  (let [zen-mode-on (fn []
                      (set nvim.wo.number false)
                      (gitsigns.detach_all)
                      (set nvim.o.showtabline 0)
                      (set nvim.o.laststatus 0)
                      (set nvim.o.colorcolumn "0")
                      (set nvim.o.ruler false)
                      (set nvim.o.showcmd false)
                      (nvim.command ":hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")
                      (set nvim.g.zenMode true))
        zen-mode-off (fn []
                       (set nvim.wo.number true)
                       (gitsigns.attach)
                       (set nvim.o.showtabline 2)
                       (set nvim.o.laststatus 2)
                       (set nvim.o.colorcolumn "80")
                       (set nvim.o.ruler true)
                       (set nvim.o.showcmd true)
                       (nvim.command ":hi! EndOfBuffer ctermbg=bg ctermfg=fg guibg=bg guifg=fg")
                       (set nvim.g.zenMode false))]
    (if nvim.g.zenMode (zen-mode-off) (zen-mode-on)))))

;; function! ExecuteMacroOverVisualRange()
;;     echo "@".getcmdline()
;;     execute ":'<,'>normal @".nr2char(getchar())
;; endfunction

(set nvim.g.dark true)

(def toggle-light-dark (fn []
  "toggle light/dark colorscheme"
  (let [go-light (fn []
                   (set nvim.g.dark false)
                   (set nvim.o.background :light))
        go-dark (fn []
                  (set nvim.g.dark true)
                  (set nvim.o.background :dark)
                  ;; (feline.reset_highlights)
                  )]
    (if nvim.g.dark (go-light) (go-dark)))))

;; TODO: these have to be written in fennel:
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

;; " ----------------------------------------------------------------
;; " modify selected text using combining diacritics
;; command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
;; command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
;; command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
;; command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
;; 
;; function! s:CombineSelection(line1, line2, cp)
;;   execute 'let char = "\u'.a:cp.'"'
;;   execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
;; endfunction

