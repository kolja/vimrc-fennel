(module plug.startify {require {nvim aniseed.nvim}})

(set nvim.g.startify_lists [
        { :type "files"     :header ["   Recently used"]      }
        { :type "dir"       :header [(.. "   " (nvim.fn.getcwd))] }
        { :type "sessions"  :header ["   Sessions"]           }
        { :type "bookmarks" :header ["   Bookmarks"]          }
        { :type "commands"  :header ["   Commands"]           }])
