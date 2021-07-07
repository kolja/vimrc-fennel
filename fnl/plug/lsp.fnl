(module plug.lsp {require {
                     nvim aniseed.nvim
                     lsp  lspconfig
                     treesitter nvim-treesitter.configs
                     }})

(defn ts-setup []
  (treesitter.setup {
    :highlight {:enable true}}))

(vim.schedule
  (fn []

    (let [
      pid (tostring (vim.fn.getpid))
      bin "/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp"]

        (lsp.omnisharp.setup {
            :cmd [bin "-lsp" "-hpid" pid]
            :filetypes ["cs"]
            :root_dir (lsp.util.root_pattern "*.csproj" "*.sln")
            :on_attach (fn [client bufnr] (ts-setup))
        }))))

