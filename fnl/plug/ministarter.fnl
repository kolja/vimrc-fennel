(module plug.ministarter {require {starter mini.starter
                                   sessions mini.sessions
                                   surround mini.surround}})

(sessions.setup {})
(surround.setup {})
(starter.setup {
                :header "NeoVim"
                :evaluate_single true
                :items [
                        {:action (starter.sections.recent_files 10 false)
                         :section "Recent"}
                        {:action (starter.sections.sessions 5 true)}
                        {:name "Telescope Recent Files" 
                         :action ":Telescope oldfiles" 
                         :section "Other"}
                        {:name "Open" 
                         :action ":NnnPicker" 
                         :section "Other"}
                        {:name "New Buffer" 
                         :action ":enew" 
                         :section "Other"}
                        ]
                :content_hooks [
                                (starter.gen_hook.aligning "center" "center")
                                (starter.gen_hook.adding_bullet "┃ ")
                                ]
                :footer ""
                })
