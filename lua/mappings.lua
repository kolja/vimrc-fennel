local _2afile_2a = "/Users/kolja/.config/nvim/fnl/mappings.fnl"
local _0_
do
  local name_0_ = "mappings"
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
    return {require("aniseed.core"), require("aniseed.nvim.util"), require("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {require = {a = "aniseed.core", nu = "aniseed.nvim.util", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local a = _local_0_[1]
local nu = _local_0_[2]
local nvim = _local_0_[3]
local _2amodule_2a = _0_
local _2amodule_name_2a = "mappings"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local nmap
do
  local v_0_
  local function nmap0(from, to)
    return nvim.set_keymap("n", from, to, {noremap = true, silent = true})
  end
  v_0_ = nmap0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["nmap"] = v_0_
  nmap = v_0_
end
local imap
do
  local v_0_
  local function imap0(from, to)
    return nvim.set_keymap("i", from, to, {noremap = true, silent = true})
  end
  v_0_ = imap0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["imap"] = v_0_
  imap = v_0_
end
local vmap
do
  local v_0_
  local function vmap0(from, to)
    return nvim.set_keymap("v", from, to, {noremap = true, silent = true})
  end
  v_0_ = vmap0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["vmap"] = v_0_
  vmap = v_0_
end
local tmap
do
  local v_0_
  local function tmap0(from, to)
    return nvim.set_keymap("t", from, to, {noremap = true, silent = true})
  end
  v_0_ = tmap0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["tmap"] = v_0_
  tmap = v_0_
end
nvim.g.mapleader = ","
nvim.g.maplocalleader = ","
nmap("<leader>t", ":call Time()<cr>")
nmap("<leader>n", ":call ToggleNum()<cr>")
nmap("j", "gj")
nmap("k", "gk")
imap("\194\172", "<C-K>*l")
nmap("\198\146", "<cmd>bn<cr>")
nmap("\226\136\130", "<cmd>bp<cr>")
imap("\198\146", "<esc><cmd>bn<cr>")
imap("\226\136\130", "<esc><cmd>bp<cr>")
tmap("\198\146", "<C-\\><C-n>:bn<CR>")
tmap("\226\136\130", "<C-\\><C-n>:bp<CR>")
tmap("<esc>", "<C-\\><C-n>")
nmap("<C-right>", ":set splitright<bar>:vnew<cr>")
nmap("<C-left>", ":set nosplitright<bar>:vnew<cr>")
nmap("<C-up>", ":set nosplitbelow<bar>:new<cr>")
nmap("<C-down>", ":set splitbelow<bar>:new<cr>")
nmap("<C-j>", "<C-W>j")
nmap("<C-k>", "<C-W>k")
nmap("<C-h>", "<C-W>h")
nmap("<C-l>", "<C-W>l")
tmap("<C-j>", "<C-\\><C-n><C-W>j")
tmap("<C-k>", "<C-\\><C-n><C-W>k")
tmap("<C-h>", "<C-\\><C-n><C-W>h")
tmap("<C-l>", "<C-\\><C-n><C-W>l")
nmap("<leader>f", ":Telescope git_files<cr>")
nmap("<leader>g", ":Telescope live_grep<cr>")
nmap("<leader>G", ":GitGutterToggle<cr>")
nmap("tt", ":NnnPicker<cr>")
nmap("<leader>z", ":call ToggleZenMode()<cr>")
nmap("n", "nzz")
nmap("N", "Nzz")
nmap("<leader>c", ":call ToggleLightDarkColorscheme()<cr>")
nmap("<leader>v", "v<C-v>")
nmap("<leader>q", ":bd<cr>")
nmap("<leader>ue", ":UltiSnipsEdit<cr>")
nvim.set_keymap("n", "<leader>s", ":%s/\\v", {noremap = true})
nmap("<leader>S", ":Startify<cr>")
vmap("<up>", "xkP`[V`]")
vmap("<down>", "xp`[V`]")
nmap("<leader>d", ":nohlsearch<cr>:echom ''<cr>")
vmap("<C-q>", "<esc>'<<C-q>'>$")
nvim.set_keymap("n", "/", "/\\v", {noremap = true})
nmap("<leader>o", "o==")
nmap("<leader>l", ":set list!")
nmap("<leader>L", ":LazyGit<cr>")
nmap("<leader>x", ":call ToggleDone()<cr>")
nu["fn-bridge"]("Time", "mappings", "show-time")
nu["fn-bridge"]("ToggleNum", "mappings", "toggle-number")
nu["fn-bridge"]("ToggleZenMode", "mappings", "toggle-zen-mode")
local show_time
do
  local v_0_
  do
    local v_0_0
    local function show_time0()
      return a.println(os.date("%H:%M"))
    end
    v_0_0 = show_time0
    _0_["show-time"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["show-time"] = v_0_
  show_time = v_0_
end
local toggle_number
do
  local v_0_
  do
    local v_0_0
    local function toggle_number0()
      nvim.wo.number = not nvim.wo.number
      return nil
    end
    v_0_0 = toggle_number0
    _0_["toggle-number"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["toggle-number"] = v_0_
  toggle_number = v_0_
end
local zen_mode_on
do
  local v_0_
  do
    local v_0_0
    local function zen_mode_on0()
      nvim.wo.number = false
      nvim.command(":GitGutterDisable")
      nvim.o.showtabline = 0
      nvim.o.laststatus = 0
      nvim.o.colorcolumn = "0"
      nvim.o.ruler = false
      nvim.o.showcmd = false
      nvim.command(":hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")
      nvim.g.zenMode = true
      return nil
    end
    v_0_0 = zen_mode_on0
    _0_["zen-mode-on"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["zen-mode-on"] = v_0_
  zen_mode_on = v_0_
end
local zen_mode_off
do
  local v_0_
  do
    local v_0_0
    local function zen_mode_off0()
      nvim.wo.number = true
      nvim.command(":GitGutterEnable")
      nvim.o.showtabline = 2
      nvim.o.laststatus = 2
      nvim.o.colorcolumn = "80"
      nvim.o.ruler = true
      nvim.o.showcmd = true
      nvim.command(":hi! EndOfBuffer ctermbg=bg ctermfg=fg guibg=bg guifg=fg")
      nvim.g.zenMode = false
      return nil
    end
    v_0_0 = zen_mode_off0
    _0_["zen-mode-off"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["zen-mode-off"] = v_0_
  zen_mode_off = v_0_
end
local toggle_zen_mode
do
  local v_0_
  do
    local v_0_0
    local function toggle_zen_mode0()
      if nvim.g.zenMode then
        return zen_mode_off()
      else
        return zen_mode_on()
      end
    end
    v_0_0 = toggle_zen_mode0
    _0_["toggle-zen-mode"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["toggle-zen-mode"] = v_0_
  toggle_zen_mode = v_0_
end
return nil