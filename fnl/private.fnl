
(module private
  {require {nvim aniseed.nvim}})

(set nvim.g.python_host_prog "/Users/kolja/.pyenv/versions/neovim2/bin/python")
(set nvim.g.python3_host_prog "/Users/kolja/.pyenv/versions/neovim3/bin/python")
(set nvim.g.python2_host_prog "/Users/kolja/.pyenv/versions/neovim2/bin/python")

(nvim.ex.command :Epub ":%s/\\v(.*)\\sby\\s(.*)\\s*\\(z-lib\\.org\\)\\.(.*)/\\2 - \\1.\\3/")
