(module plug.neomake {require {nvim aniseed.nvim}})

(set nvim.g.neomake_javascript_eslint_exe "/usr/local/bin/eslint")
(set nvim.g.neomake_javascript_enabled_makers [:eslint])
(set nvim.g.neomake_warning_sign {:text "⚠" :texthl "WarningMsg"})
(set nvim.g.neomake_error_sign   {:text "✕" :texthl "ErrorMsg"})
(set nvim.g.neomake_message_sign {:text "➤" :texthl "InfoMsg"})
(set nvim.g.neomake_info_sign    {:text "ℹ" :texthl "InfoMsg"})

