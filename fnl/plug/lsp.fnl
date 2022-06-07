(module plug.lsp {require {
                     nvim aniseed.nvim
                     lsp  lspconfig
                     treesitter nvim-treesitter.configs
                     signature lsp_signature
                     }})

(defn ts-setup []
  (treesitter.setup {
    :highlight {:enable true}}))

;; See `:help vim.lsp.*` for documentation on any of the below functions
(vim.keymap.set [:n] "gD"        "<Cmd>lua vim.lsp.buf.declaration()<CR>")
(vim.keymap.set [:n] "gd"        "<Cmd>lua vim.lsp.buf.definition()<CR>")
(vim.keymap.set [:n] "K"         "<Cmd>lua vim.lsp.buf.hover()<CR>")
(vim.keymap.set [:n] "gi"        "<Cmd>lua vim.lsp.buf.implementation()<CR>")
(vim.keymap.set [:i :n] "<C-K>"     "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
(vim.keymap.set [:n] "<leader>D" "<Cmd>lua vim.lsp.buf.type_definition()<CR>")
(vim.keymap.set [:n] "<leader>R" "<Cmd>lua vim.lsp.buf.rename()<CR>")
(vim.keymap.set [:n] "<leader>A" "<Cmd>lua vim.lsp.buf.code_action()<CR>")
(vim.keymap.set [:n] "gr"        "<Cmd>lua vim.lsp.buf.references()<CR>")
(vim.keymap.set [:n] "=="        "<Cmd>lua vim.lsp.buf.formatting()<CR>")

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

        ;; (lsp.phpactor.setup {
        ;;                      :cmd ["phpactor"]
        ;;                      :filetypes ["php"]
        ;;                      :root_dir (lsp.util.root_pattern "composer.json" ".git") 
        ;;                      })
        (lsp.intelephense.setup {})

        ;; (lsp.julials.setup { 
            ;; :cmd ["julia" "--startup-file=no" "--history-file=no" "/Users/kolja/.config/nvim/lua/lsp.jl"]
            ;; :filetypes ["julia"]
            ;; :on_new_config (fn [new_config _]
            ;;     (let [
            ;;       server_path (vim.fn.system "/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia --startup-file=no -q -e 'print(dirname(dirname(Base.find_package(\"LanguageServer\"))))'")
            ;;       new_cmd (vim.deepcopy cmd)]
            ;;         (table.insert new_cmd 2 (.. "--project=" server_path))
            ;;         (set new_config.cmd new_cmd)))
            ;; :root_dir (fn [fname]
            ;;     (or (lsp.util.find_git_ancestor fname) (vim.fn.getcwd)))
            ;; :on_attach (fn [client bufnr] 
            ;;               ;; (require'diagnostic'.on_attach)
            ;; )
        ;; })
    )))

