
local vimp = require 'vimp'

local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- reload config via nvim-reload plugin
vimp.nnoremap('<leader>r', function()
  vimp.unmap_all()
  cmd('Reload') -- TODO: configure Reload Plugin
end)

vimp.nnoremap('<leader>n', function()
  vim.wo.number = not vim.wo.number
end)

vimp.map_command('Vimrc', function()
    require('telescope.builtin').find_files { -- file_browser, live_grep, git_files    
        prompt_title = 'Vimrc Config',
        file_ignore_patterns = {'UltiSnips/*.*'},
        cwd = '~/.vim'
    }
end)

vimp.map_command('Epub', function()
    cmd('%s!\\v(.*)\\sby\\s(.*)\\s\\(z-lib.org\\)!\\2 - \\1!')
end)

vimp.map_command('Time', function()
   print(os.date('%H:%M'))
end)
vimp.nnoremap('<leader>t', '<cmd>Time<cr>')

-- autocmd BufWinEnter,WinEnter term://* startinsert
-- autocmd BufLeave term://* stopinsert

-- , used to have this 'backwards to character' functionality. Use '\' for this instead.
vimp.nnoremap(';', ',')

-- navigate wrapped lines the same way you navigate non-wrapped lines
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')

-- map <option>l to λ
vimp.inoremap('¬', '<C-K>*l')

-- navigate buffers: cmd-shift-l = ƒ  cmd-shift-h = ∂
vimp.nnoremap('ƒ', '<cmd>bn<cr>')
vimp.nnoremap('∂', '<cmd>bp<cr>')
vimp.inoremap('ƒ', '<esc><cmd>bn<cr>')
vimp.inoremap('∂', '<esc><cmd>bp<cr>')

vimp.tnoremap('ƒ', '<C-\\><C-n>:bn<CR>')
vimp.tnoremap('∂', '<C-\\><C-n>:bp<CR>')
vimp.tnoremap('<esc>', '<C-\\><C-n>')

-- create split windows intuitively
vimp.nnoremap('<C-right>', function() opt.splitright=true cmd('vnew') end)
vimp.nnoremap('<C-left>',  function() opt.splitright=false cmd('vnew') end)
vimp.nnoremap('<C-up>',    function() opt.splitbelow=false cmd('new') end)
vimp.nnoremap('<C-down>',  function() opt.splitbelow=true cmd('new') end)

-- Smart way to move beteen windows
vimp.nnoremap('<C-j>', '<C-W>j')
vimp.nnoremap('<C-k>', '<C-W>k')
vimp.nnoremap('<C-h>', '<C-W>h')
vimp.nnoremap('<C-l>', '<C-W>l')

vimp.tnoremap('<C-j>', '<C-\\><C-n><C-W>j')
vimp.tnoremap('<C-k>', '<C-\\><C-n><C-W>k')
vimp.tnoremap('<C-h>', '<C-\\><C-n><C-W>h')
vimp.tnoremap('<C-l>', '<C-\\><C-n><C-W>l')

-- Save and run on the commandline
-- vimp.nnoremap('<leader>r', ':w<cr> <bar> :!%:p<cr>')

vimp.nnoremap('<leader>f', ':Telescope git_files<cr>')
vimp.nnoremap('<leader>g', ':Telescope live_grep<cr>')

vimp.nnoremap('<leader>p', function()
    require'telescope.builtin'.builtin{}
end)

vimp.nnoremap('<leader>G', ':GitGutterToggle<cr>')
vimp.nnoremap('tt', ':NnnPicker<cr>')

-- add {'expr', 'silent'} and you get error messages
-- also tried: function() fn.ToggleZenMode() end
vimp.nnoremap('<leader>z', ':call ToggleZenMode()<cr>')

vimp.nnoremap('n', 'nzz')
vimp.nnoremap('N', 'Nzz')

-- toggle colorscheme (from vimrc-base)
vimp.nnoremap('<leader>c', ':call ToggleLightDarkColorscheme()<cr>')

-- visual Block mode
vimp.nnoremap('<leader>v', 'v<C-v>')

vimp.nnoremap('<leader>q', ':bd<cr>')

-- Fast editing of Snippets
vimp.nnoremap('<leader>ue', ':UltiSnipsEdit<cr>')
--
-- search and replace
vimp.nnoremap('<leader>s', ':%s/\\v')

vimp.nnoremap('<leader>S', ':Startify<cr>')

-- move blocks of text in visual mode
vimp.vnoremap('<up>',   'xkP`[V`]')
vimp.vnoremap('<down>', 'xp`[V`]')

-- leader-d to remove a selection -- somehow reminds me of cmd-d in Photoshop
vimp.nnoremap('<leader>d', ':nohlsearch<cr>')

-- make A and I work in visual mode as they do in visual block mode
vimp.vnoremap('<C-q>', '<esc>\'<<C-q>\'>$')

-- always use 'very magic' regexes
vimp.nnoremap('/', '/\\v')

-- -- fix indentation after splice
vimp.nnoremap('<leader>o', 'o==')

vimp.nnoremap('<leader>l', function()
    vim.wo.list = not vim.wo.list
end)

vimp.nnoremap('<leader>L', ':LazyGit<cr>')

-- remove whitespace from line endings, preserver cursor posistion
vimp.nnoremap('<leader><space>', [[:call Preserve('%s/\s\+$//e')<cr>]])

-- check todo item
vimp.nnoremap('<leader>x', ':call ToggleDone()<cr>')

-- --------------------- From Drews Neil's vimrc:
-- Visual line repeat
-- xnoremap . :normal .<CR>
-- xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

