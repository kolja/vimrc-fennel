(module plug.lsp {require {
                     nvim aniseed.nvim
                     lsp  lspconfig
                     treesitter nvim-treesitter.configs
                     signature lsp_signature
                     rt rust-tools
                     }})

(defn ts-setup []
  (treesitter.setup {
    :highlight {:enable true}}))

;; See `:help vim.lsp.*` for documentation on any of the below functions
(vim.keymap.set [:n] "gD"        vim.lsp.buf.declaration)
(vim.keymap.set [:n] "gd"        vim.lsp.buf.definition)
(vim.keymap.set [:n] "K"         vim.lsp.buf.hover)
(vim.keymap.set [:n] "gi"        vim.lsp.buf.implementation)
(vim.keymap.set [:i :n] "<C-K>"  vim.lsp.buf.signature_help)
(vim.keymap.set [:n] "<leader>D" vim.lsp.buf.type_definition)
(vim.keymap.set [:n] "<leader>R" vim.lsp.buf.rename)
(vim.keymap.set [:n] "<leader>A" vim.lsp.buf.code_action)
(vim.keymap.set [:n] "gr"        vim.lsp.buf.references)
(vim.keymap.set [:n] "=="        vim.lsp.buf.format)

(vim.schedule
  (fn []

    (let [
      pid (tostring (vim.fn.getpid))
      bin "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp"]

        (lsp.omnisharp.setup {
            :cmd [bin "-lsp" "-hpid" pid]
            :filetypes ["cs"]
            :root_dir (lsp.util.root_pattern "*.csproj" "*.sln")
            :on_attach (fn [client bufnr] 
                              (ts-setup)
                              (signature.on_attach))
        })

        (lsp.intelephense.setup {})

        (rt.setup {
          :server {
            :on_attach (fn [_ bufnr]
              ;; Hover actions
              ;; (vim.keymap.set [:n] "K" rt.hover_actions.hover_actions {:buffer bufnr})
              ;; Code action groups
              ;; (vim.keymap.set [:n] "<Leader>a" rt.code_action_group.code_action_group {:buffer bufnr})
          )}}))

    
))

