
(module plugins {require {nvim aniseed.nvim
                          packer packer}})

(packer.startup (fn []
  ;; Packer can manage itself
  (use "wbthomason/packer.nvim")

  ;; Fennel support
  (use {1 "Olical/aniseed" :config (fn [] (set nvim.g.aniseed#env true))})

  (use "bakpakin/fennel.vim")
  (use "Olical/conjure")
  
  (use "famiu/nvim-reload")

  (use "mhinz/vim-startify")
  (use "akinsho/nvim-bufferline.lua")
  (use "famiu/feline.nvim")
  (use "norcalli/nvim-colorizer.lua")
  
  (use "mcchrish/nnn.vim")

  (use "iCyMind/NeoSolarized")
  (use "flazz/vim-colorschemes")

  (use "vimwiki/vimwiki")
  (use "kdheepak/lazygit.nvim")

  (use "tpope/vim-surround")
  (use "tpope/vim-repeat")
  (use "michaeljsmith/vim-indent-object")
  (use "airblade/vim-gitgutter")
  (use "sirver/ultisnips")
  (use "godlygeek/tabular")

  (use "neovim/nvim-lspconfig")
  (use "nvim-lua/completion-nvim")
  (use "kabouzeid/nvim-lspinstall")

  ;; C# support
  (use "OmniSharp/omnisharp-vim")
  (use "dense-analysis/ale")

  (use {1 "neomake/neomake" :run "npm install -g npm-which"})

  ;;(use {
  ;;  1 "nvim-telescope/telescope.nvim"
  ;;  :requires [["nvim-lua/popup.nvim"]
  ;;             ["nvim-lua/plenary.nvim"]
  ;;             {1 "nvim-telescope/telescope-fzf-native.nvim" :run "make"}]
  ;;})

  (use "kyazdani42/nvim-web-devicons")
))
