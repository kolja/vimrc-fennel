(module plug.omnisharp {require {
                           nvim aniseed.nvim
                           lsp  lspconfig}})

;; ;; Use the stdio OmniSharp-roslyn server
(set nvim.g.OmniSharp_server_stdio true)
(set nvim.g.OmniSharp_server_use_mono false)
(set nvim.g.OmniSharp_server_path "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp")
(set nvim.g.OmniSharp_server_stdio_quickload true)
(set nvim.g.OmniSharp_expected_server_version "1.35.3")
(set nvim.g.OmniSharp_typeLookupInPreview true)
(set nvim.g.OmniSharp_start_without_solution true)
(set nvim.g.OmniSharp_want_snippet true)
(set nvim.g.OmniSharp_popup true)
(set nvim.g.OmniSharp_popup_options {:winblend 30 :winhl "Normal:Normal"})
;; (set nvim.g.OmniSharp_timeout 5)
;; ;; (set nvim.g.omnicomplete_fetch_full_documentation 1)
(set nvim.g.OmniSharp_want_snippet true)
;; ;; (set nvim.g.OmniSharp_selector_ui :fzf)
(set nvim.g.OmniSharp_highlight_types 3)
(set nvim.o.previewheight 5)

;; (nvim.ex.command :Rename "<plug>OmniSharp#actions#renameTo(\"<args>\")" {:nargs true})

(vim.schedule
  (fn []

    (let [pid (tostring (vim.fn.getpid))
          ;; completion (require "completion")
          bin "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp"]

      (lsp.omnisharp.setup {
          :cmd {bin "--languageserver" "--hostPID" pid}
          :filetypes ["cs"]
          :root_dir (lsp.util.root_pattern ".csproj" ".sln")
          ;;:on_attach (. completion :on_attach)
      }))))

