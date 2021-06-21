
-- LSP setup

local pid = tostring( vim.fn.getpid())
local omnisharp_bin = '/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp'
-- local omnisharp_bin = '/Users/kolja/.cache/omnisharp-vim/omnisharp-roslyn/run'
local lsp = require'lspconfig'

lsp.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", pid},
    -- init_options = {}
    filetypes = { "cs" },
    root_dir = lsp.util.root_pattern('.csproj', '.git'),
    on_attach = require'completion'.on_attach
}

