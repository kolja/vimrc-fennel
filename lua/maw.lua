

-- maw: a map wrapper
-- for more convenient switching from viml to lua
-- Kolja, 2021

local maw = {}

funcs = {}  -- do I really need a global var for this?

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

maw.togglewin = function(option) 
    return function()
        local val = vim.api.nvim_win_get_option(0, option)
        vim.api.nvim_win_set_option(0, option, not val)
    end
end

maw.map = function(mode, key, mapping, opts)

  local options = {noremap = true, silent = true}

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  if (type(mapping) == 'string') then
      vim.api.nvim_set_keymap(mode, key, mapping, options)
  end

  if (type(mapping) == 'function') then
      funcs[t(key)] = mapping
      vim.api.nvim_set_keymap(mode, key, ':lua funcs[\''..t(key)..'\']()<cr>', options) 
  end
end

maw.nmap = function(key, mapping, opts) maw.map('n', key, mapping, opts) end
maw.imap = function(key, mapping, opts) maw.map('i', key, mapping, opts) end
maw.vmap = function(key, mapping, opts) maw.map('v', key, mapping, opts) end
maw.tmap = function(key, mapping, opts) maw.map('t', key, mapping, opts) end

return maw;

