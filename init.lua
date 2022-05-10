-- This is the first file Neovim will load.
-- adapted from https://github.com/Olical/magic-kit

local execute = vim.api.nvim_command
local fn = vim.fn
local fmt = string.format

-- Work out where our plugins will be stored.
local pack_path = fn.stdpath("data") .. "/site/pack"

function ensure (user, repo)
  -- Ensures a given github.com/USER/REPO is cloned in the pack/packer/start directory.
  local install_path = fmt("%s/packer/start/%s", pack_path, repo, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone https://github.com/%s/%s %s", user, repo, install_path))
    execute(fmt("packadd %s", repo))
  end
end

ensure("wbthomason", "packer.nvim")
ensure("Olical", "aniseed")

vim.g["aniseed#env"] = {module = "init"}

-- next up: fnl/init.fnl
