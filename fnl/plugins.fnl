(module plugins {require {nvim aniseed.nvim
                          aniseed-env aniseed.env
                          packer packer}})

(packer.startup (fn []
  ;; Packer can manage itself
  (use "wbthomason/packer.nvim")

  ;; Fennel support
  (use "Olical/aniseed")

  (use "kolja/repl-alliance")
  (use "bakpakin/fennel.vim")
  (use "Olical/conjure")

  ;; Colorscheme
  (use "flazz/vim-colorschemes")
  (use "iCyMind/NeoSolarized")
  (use "onsails/lspkind.nvim")

  (use "tpope/vim-sexp-mappings-for-regular-people")
  (use "guns/vim-sexp")
  (use "kolja/telescope-opds") 
  (use "famiu/nvim-reload")

  (use "norcalli/nvim-colorizer.lua")
  (use {1 "echasnovski/mini.nvim" :branch "stable" })
  (use "akinsho/nvim-bufferline.lua")
  (use {1 "nvim-lualine/lualine.nvim" :requires {1 "kyazdani42/nvim-web-devicons" :opt true}})

  (use "mcchrish/nnn.vim")

  (use "akinsho/toggleterm.nvim")
  (use "michaeljsmith/vim-indent-object")
  (use "lewis6991/gitsigns.nvim")

  (use "neovim/nvim-lspconfig")
  (use {1 "nvim-treesitter/nvim-treesitter" :run :TSUpdate})
  (use "j-hui/fidget.nvim")
  ;; (use "folke/lsp-colors.nvim")

  (use "hrsh7th/cmp-nvim-lsp")
  (use "hrsh7th/cmp-buffer")
  (use "hrsh7th/cmp-path")
  (use "hrsh7th/cmp-cmdline")
  (use "hrsh7th/nvim-cmp")

  (use "L3MON4D3/LuaSnip")
  (use "saadparwaiz1/cmp_luasnip")
  (use "godlygeek/tabular")
  (use "windwp/nvim-autopairs")

  (use "ray-x/lsp_signature.nvim")
  (use "kabouzeid/nvim-lspinstall")
  (use "simrat39/rust-tools.nvim")

  (use "numToStr/Comment.nvim")
  ;; C# support
  (use "dense-analysis/ale")

  ;; TeX support
  (use "lervag/vimtex")

  ;; Julia support
  (use "JuliaEditorSupport/julia-vim")

  (use {1 "neomake/neomake" :run "npm install -g npm-which"})

  (use {
    1 "nvim-telescope/telescope.nvim"
    :requires [["nvim-lua/popup.nvim"]
               ["nvim-lua/plenary.nvim"]
               {1 "nvim-telescope/telescope-fzf-native.nvim" :run "make"}]
  })

  (use "kyazdani42/nvim-web-devicons")
)
  :config {
     :git {:clone_timeout 30}
  }
)

;; Haskell support
;; (use "neovimhaskell/haskell-vim")
;; (use "Twinside/vim-haskellConceal")
;;
;; Elm support
;; (use "lambdatoast/elm.vim")
;;
