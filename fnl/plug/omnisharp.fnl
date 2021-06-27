(module plug.omnisharp {require {nvim aniseed.nvim}})

;; Use the stdio OmniSharp-roslyn server
(set nvim.g.OmniSharp_server_stdio 1)
(set nvim.g.OmniSharp_server_use_mono 0)
(set nvim.g.OmniSharp_server_path "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp")
(set nvim.g.OmniSharp_server_stdio_quickload 1)
(set nvim.g.OmniSharp_expected_server_version "1.35.3")
;; (set nvim.g.OmniSharp_typeLookupInPreview 1)
(set nvim.g.OmniSharp_start_without_solution 1)
(set nvim.g.OmniSharp_want_snippet 1)
(set nvim.g.OmniSharp_popup 1)
(set nvim.g.OmniSharp_popup_options {:winblend 30 :winhl "Normal:Normal"})
(set nvim.g.OmniSharp_timeout 5)
;; (set nvim.g.omnicomplete_fetch_full_documentation 1)
(set nvim.g.OmniSharp_want_snippet 1)
;; (set nvim.g.OmniSharp_selector_ui :fzf)
(set nvim.g.OmniSharp_highlight_types 3)

(set nvim.o.previewheight 5)

(nvim.ex.command :Rename ":call OmniSharp#RenameTo(\"<args>\")" {:nargs true})

;; function! CsharpFolds()
;;   let thisline = getline(v:lnum)
;;   if match(thisline, '^\s*#region') >= 0
;;     return "a1"
;;   elseif match(thisline, '^\s*#endregion') >= 0
;;     return "s1"
;;   else
;;     return "="
;;   endif
;; endfunction
;; setlocal foldmethod=expr
;; setlocal foldexpr=CsharpFolds()
;; 
;; function! CsharpFoldText()
;;   let foldsize = (v:foldend-v:foldstart)
;;   return getline(v:foldstart).' ('.foldsize.' lines)'
;; endfunction
;; 
;; setlocal foldtext=CsharpFoldText()

(vim.schedule
  (fn []

    (let [pid (tostring (vim.fn.getpid))
          bin "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp"
          lsp (require "lspconfig")
          completion (require "completion")]

      (lsp.omnisharp.setup {
          :cmd {:omnisharp_bin "--languageserver" "--hostPID" pid}
          :filetypes [:cs]
          :root_dir (lsp.util.root_pattern ".csproj" ".git")
          :on_attach (completion.on_attach)
      }))))

