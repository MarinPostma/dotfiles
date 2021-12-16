-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mpostma/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/mpostma/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/mpostma/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/mpostma/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mpostma/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { '\27LJ\1\2Š\2\0\0\a\0\f\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0007\0\5\0003\1\6\0\16\2\0\0%\3\a\0%\4\b\0%\5\t\0\16\6\1\0>\2\5\1\16\2\0\0%\3\n\0%\4\b\0%\5\v\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>\6t+<CMD>lua require("FTerm").toggle()<CR>\15<leader>tt\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0' },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["circles.nvim"] = {
    after = { "nvim-tree.lua" },
    loaded = true,
    only_config = true
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2`\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\1\ntheme\15catppuccin\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  neogit = {
    config = { "\27LJ\1\2n\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\1\tkind\16split_above\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÆ\4\1\0\a\0%\0K4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0003\3\4\0001\4\3\0:\4\5\3:\3\a\0023\3\v\0007\4\b\0007\5\b\0007\5\t\5'\6üÿ>\5\2\0023\6\n\0>\4\3\2:\4\f\0037\4\b\0007\5\b\0007\5\t\5'\6\4\0>\5\2\0023\6\r\0>\4\3\2:\4\14\0037\4\b\0007\5\b\0007\5\15\5>\5\1\0023\6\16\0>\4\3\2:\4\17\0037\4\18\0007\4\19\4:\4\20\0037\4\b\0003\5\22\0007\6\b\0007\6\21\6>\6\1\2:\6\23\0057\6\b\0007\6\24\6>\6\1\2:\6\25\5>\4\2\2:\4\26\0037\4\b\0007\5\b\0007\5\27\5>\5\1\0023\6\28\0>\4\3\2:\4\29\0037\4\b\0007\4\30\0043\5\31\0>\4\2\2:\4 \3:\3\b\0027\3\18\0007\3!\0032\4\3\0003\5\"\0;\5\1\0043\5#\0;\5\2\0042\5\3\0003\6$\0;\6\1\5>\3\3\2:\3!\2>\1\2\1G\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<Tab>\1\3\0\0\6i\6s\21select_next_item\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2‡\2\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\trust\fclojure\fhaskell\ttoml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0\21rustfmt_autosave\6g\bvim\0" },
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["vim-mergetool"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/vim-mergetool",
    url = "https://github.com/samoshkin/vim-mergetool"
  },
  ["vim-sexp"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people",
    url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/mpostma/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: rust.vim
time([[Config for rust.vim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0\21rustfmt_autosave\6g\bvim\0", "config", "rust.vim")
time([[Config for rust.vim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2C\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireÆ\4\1\0\a\0%\0K4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0003\3\4\0001\4\3\0:\4\5\3:\3\a\0023\3\v\0007\4\b\0007\5\b\0007\5\t\5'\6üÿ>\5\2\0023\6\n\0>\4\3\2:\4\f\0037\4\b\0007\5\b\0007\5\t\5'\6\4\0>\5\2\0023\6\r\0>\4\3\2:\4\14\0037\4\b\0007\5\b\0007\5\15\5>\5\1\0023\6\16\0>\4\3\2:\4\17\0037\4\18\0007\4\19\4:\4\20\0037\4\b\0003\5\22\0007\6\b\0007\6\21\6>\6\1\2:\6\23\0057\6\b\0007\6\24\6>\6\1\2:\6\25\5>\4\2\2:\4\26\0037\4\b\0007\5\b\0007\5\27\5>\5\1\0023\6\28\0>\4\3\2:\4\29\0037\4\b\0007\4\30\0043\5\31\0>\4\2\2:\4 \3:\3\b\0027\3\18\0007\3!\0032\4\3\0003\5\"\0;\5\1\0043\5#\0;\5\2\0042\5\3\0003\6$\0;\6\1\5>\3\3\2:\3!\2>\1\2\1G\0\1\0\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<Tab>\1\3\0\0\6i\6s\21select_next_item\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\vconfig\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-d>\1\0\0\1\3\0\0\6i\6c\16scroll_docs\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2‡\2\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\trust\fclojure\fhaskell\ttoml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring('\27LJ\1\2Š\2\0\0\a\0\f\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\0014\0\3\0007\0\4\0007\0\5\0003\1\6\0\16\2\0\0%\3\a\0%\4\b\0%\5\t\0\16\6\1\0>\2\5\1\16\2\0\0%\3\n\0%\4\b\0%\5\v\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>\6t+<CMD>lua require("FTerm").toggle()<CR>\15<leader>tt\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0', "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2`\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\foptions\1\0\0\1\0\1\ntheme\15catppuccin\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\1\2n\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\1\tkind\16split_above\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\1\2<\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: circles.nvim
time([[Config for circles.nvim]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\fcircles\frequire\0", "config", "circles.nvim")
time([[Config for circles.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")

time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
