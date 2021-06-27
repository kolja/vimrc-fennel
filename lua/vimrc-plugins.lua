
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Fennel support
    use {'Olical/aniseed', config = function() 
        vim.api.nvim_set_var('aniseed#env', {output = 'fnllua'}) 
    end}

    use 'bakpakin/fennel.vim'
    use 'Olical/conjure'
    
    use 'famiu/nvim-reload'

    use 'mhinz/vim-startify'
    use 'akinsho/nvim-bufferline.lua'
    use 'famiu/feline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    
    use 'mcchrish/nnn.vim'

    use 'iCyMind/NeoSolarized'
    use 'flazz/vim-colorschemes'

    use 'vimwiki/vimwiki'
    use 'kdheepak/lazygit.nvim'

    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'michaeljsmith/vim-indent-object'
    use 'airblade/vim-gitgutter'
    use 'sirver/ultisnips'
    use 'godlygeek/tabular'

    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'kabouzeid/nvim-lspinstall'

    -- C# support
    use 'OmniSharp/omnisharp-vim'
    use 'dense-analysis/ale'

    use {'neomake/neomake', run = 'npm install -g npm-which'}
    -- use {'neoclide/coc.nvim', branch = 'release'}

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'},
                  {'nvim-lua/plenary.nvim'},
                  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
                  -- {'fannheyward/telescope-coc.nvim'}
      }
    }

    use 'kyazdani42/nvim-web-devicons'
end)

--"Plug 'L9' " general purpose utility functions
--"Plug 'moll/vim-bbye'          " intuitive closing of Buffers, altervative to :bd
--Plug 'rking/ag.vim'
--
--Plug 'felixhummel/setcolors.vim'
--
--Plug 'tpope/vim-fugitive'
--Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
--Plug 'junegunn/fzf.vim'
--Plug 'plasticboy/vim-markdown'
--
--
--" Clojure support. see: http://www.neo.com/2014/02/25/getting-started-with-clojure-in-vim
--" Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' Plug 'clojure-vim/acid.nvim'} " doesn't quite work yet, apparently
--
--Plug 'kolja/repl-alliance'
--" Plug 'tpope/vim-fireplace'
--" Plug 'jebberjeb/clojure-socketrepl.nvim'
--" Plug 'tpope/vim-classpath'
--" Plug 'tpope/vim-salve' " files will take ages to open after project.clj has been changed
--
--Plug 'guns/vim-sexp'
--Plug 'tpope/vim-sexp-mappings-for-regular-people'
--" Plug 'liquidz/vim-iced', {'for': 'clojure'}
--" Plug 'SevereOverfl0w/async-clj-omni'
--" Plug 'clojure-vim/clj-refactor.nvim'
--" Plug 'neovim/node-host' " dependency to cljrefactor
--" Plug 'kolja/vim-cljfmt'
--
--"" Haskell support
--" Plug 'neovimhaskell/haskell-vim'
--" Plug 'Twinside/vim-haskellConceal'
--
--" Elm support
--" Plug 'lambdatoast/elm.vim'
--
--" Julia support
--Plug 'JuliaEditorSupport/julia-vim'
--
--" JavaScript support
--Plug 'pangloss/vim-javascript'
--Plug 'jelera/vim-javascript-syntax'
--Plug 'prettier/vim-prettier', {
--  \ 'do': 'npm install',
--  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
--
--" TeX support
--Plug 'lervag/vimtex'
--
--Plug 'Shougo/deoplete.nvim', {'do': function('DoRemote')}
--Plug 'ternjs/tern_for_vim', {'do': 'npm install && npm install -g tern' }
--
--"Plug 'Rykka/riv.vim'
--"Plug 'Rykka/InstantRst'
--
--Plug 'mattn/emmet-vim'
--
--Plug 'rizzatti/dash.vim'
--Plug 'scrooloose/nerdcommenter'
--"Plug 'tomtom/tregisters_vim'
--"Plug 'genutils'
--Plug 'ryanoasis/vim-devicons'
