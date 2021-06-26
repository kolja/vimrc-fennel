
(module plugins.vimwiki
  {require {nvim aniseed.nvim}})

(set nvim.g.vimwiki_list [{"path"             "~/Documents/notes/" 
                           "links_space_char" "_" 
                           "syntax"           "markdown" 
                           "ext"              ".md"}])

(set nvim.g.vimwiki_ext2syntax  {".md" "markdown"})
(set nvim.g.vimwiki_filetypes   [:markdown :pandoc])
