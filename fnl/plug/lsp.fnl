(module plug.lsp {require {
                     nvim aniseed.nvim
                     lsp  lspconfig
                     treesitter nvim-treesitter.configs
                     signature lsp_signature
                     }})

(defn ts-setup []
  (treesitter.setup {
    :highlight {:enable true}}))

(defn- imap [from to] (nvim.set_keymap :i from to {:noremap true :silent true :expr true}))
(defn- nmap [from to] (nvim.set_keymap :n from to {:noremap true :silent true}))

(imap "<C-Space>" "compe#complete()")
;; (imap :<CR>      "compe#confirm(luaeval(\"require 'nvim-autopairs'.autopairs_cr()\"))")
(imap "<CR>"      "compe#confirm({'keys': '<CR>', 'select': v:true})")
(imap "<C-e>"     "compe#close('<C-e>')")
(imap "<C-f>"     "compe#scroll({'delta': +4})")
(imap "<C-d>"     "compe#scroll({'delta': -4})")

;; See `:help vim.lsp.*` for documentation on any of the below functions
(nmap "gD"              "<Cmd>lua vim.lsp.buf.declaration()<CR>")
(nmap "gd"              "<Cmd>lua vim.lsp.buf.definition()<CR>")
(nmap "K"               "<Cmd>lua vim.lsp.buf.hover()<CR>")
(nmap "gi"              "<cmd>lua vim.lsp.buf.implementation()<CR>")
(nmap "<C-k>"           "<cmd>lua vim.lsp.buf.signature_help()<CR>")
(nmap "<leader>D"       "<cmd>lua vim.lsp.buf.type_definition()<CR>")
(nmap "<leader>R"       "<cmd>lua vim.lsp.buf.rename()<CR>")
(nmap "<C-;>"           "<cmd>lua vim.lsp.buf.code_action()<CR>")
(nmap "gr"              "<cmd>lua vim.lsp.buf.references()<CR>")
(nmap "=="              "<cmd>lua vim.lsp.buf.formatting()<CR>")

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

        (lsp.julials.setup { 
            :cmd ["julia" "--startup-file=no" "--history-file=no" "/Users/kolja/.config/nvim/lua/lsp.jl"]
            :filetypes ["julia"]
            :on_new_config (fn [new_config _]
                (let [
                  server_path (vim.fn.system "/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia --startup-file=no -q -e 'print(dirname(dirname(Base.find_package(\"LanguageServer\"))))'")
                  new_cmd (vim.deepcopy cmd)]
                    (table.insert new_cmd 2 (.. "--project=" server_path))
                    (set new_config.cmd new_cmd)))
            :root_dir (fn [fname]
                (or (lsp.util.find_git_ancestor fname) (vim.fn.getcwd)))
            :on_attach (fn [client bufnr] 
                          ;; (require'diagnostic'.on_attach)
            )
        })
    )))

;; local cmd = {}

