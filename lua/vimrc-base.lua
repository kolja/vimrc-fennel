
-------------------- LSP / Omnisharp

local pid = tostring( vim.fn.getpid())
local omnisharp_bin = '/usr/local/Cellar/omnisharp-mono/1.35.3/bin/omnisharp'
local lsp = require('lspconfig')

lsp.omnisharp.setup {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", pid},
    filetypes = { "cs" },
    root_dir = lsp.util.root_pattern('.csproj', '.git'),
    on_attach = require'completion'.on_attach
}

-------------------- bufferline

require('bufferline').setup {
  options = {
    numbers = 'none', --"none" | "ordinal" | "buffer_id" | "both",
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = 'thin', -- | "thick" | "slant" | { 'any', 'any' },
    enforce_regular_tabs = true, --false | true,
    always_show_bufferline = true
  }
}

require'colorizer'.setup()

vim.o.showmode = false
