local _2afile_2a = "/Users/kolja/.config/nvim/fnl/init.fnl"
local _0_
do
  local name_0_ = "init"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  do end (module_0_)["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  do end (package.loaded)[name_0_] = module_0_
  _0_ = module_0_
end
local autoload
local function _1_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _1_
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {require("base"), require("plugins.bufferline"), require("plugins.autocomplete"), require("mappings"), require("plugins.misc"), require("plugins.omnisharp"), require("private"), require("plugins.telescope"), require("plugins.ultisnips"), require("plugins.vimwiki")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {require = {base = "base", bufferline = "plugins.bufferline", complete = "plugins.autocomplete", mappings = "mappings", misc = "plugins.misc", omnisharp = "plugins.omnisharp", private = "private", telescope = "plugins.telescope", ultisnips = "plugins.ultisnips", vimwiki = "plugins.vimwiki"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local base = _local_0_[1]
local vimwiki = _local_0_[10]
local bufferline = _local_0_[2]
local complete = _local_0_[3]
local mappings = _local_0_[4]
local misc = _local_0_[5]
local omnisharp = _local_0_[6]
local private = _local_0_[7]
local telescope = _local_0_[8]
local ultisnips = _local_0_[9]
local _2amodule_2a = _0_
local _2amodule_name_2a = "init"
return ({nil, _0_, nil, {{}, nil, nil, nil}})[2]