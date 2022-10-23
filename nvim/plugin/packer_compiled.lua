-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mpostma/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mpostma/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mpostma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mpostma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mpostma/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\nŠ\2\0\0\b\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\b\0'\6\v\0\18\a\1\0B\2\5\1K\0\1\0005<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\15<leader>tt\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    config = { "\27LJ\2\n§\1\0\0\3\0\n\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\nsetup\15catppuccin\frequire\14macchiato\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["circles.nvim"] = {
    after = { "nvim-tree.lua" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcircles\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/circles.nvim",
    url = "https://github.com/projekt0n/circles.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n±\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3d\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\a\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\vbuffer\2\fnoremap\2\17n <leader>hb0<cmd>lua require\"gitsigns\".blame_line()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\2\nnumhl\1\18sign_priority\3\5\17changedelete\1\0\3\ttext\6~\ahl\15DiffChange\nnumhl\21GitSignsChangeNr\14topdelete\1\0\3\ttext\6_\ahl\15DiffDelete\nnumhl\21GitSignsDeleteNr\vdelete\1\0\3\ttext\bâ–Œ\ahl\15DiffDelete\nnumhl\21GitSignsDeleteNr\vchange\1\0\3\ttext\bâ–Œ\ahl\15DiffChange\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\3\ttext\bâ–Œ\ahl\fDiffAdd\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["lsp-status.nvim"] = {
    config = { "\27LJ\2\n—\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\4\0B\1\2\1K\0\1\0\1\0\4\16diagnostics\1\18status_symbol\5\18show_filename\1\21current_function\2\vconfig\22register_progress\15lsp-status\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/nvim-lua/lsp-status.nvim"
  },
  neogit = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\1\tkind\16split_above\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cokeline"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rcokeline\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-cokeline",
    url = "https://github.com/noib3/nvim-cokeline"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n€\1\0\1\5\3\3\1\19-\1\0\0\18\3\1\0009\1\0\1B\1\2\1-\1\1\0\18\3\1\0009\1\0\1B\1\2\1-\1\2\0\18\3\1\0009\1\0\1B\1\2\1\b\0\0\0X\1\4€6\1\1\0'\3\2\0\18\4\0\0B\1\3\1K\0\1\0\3À\4À\6€\30codelldb exited with code\nprint\nclose\0=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\vappend\rdap.repl\frequireL\1\2\6\0\4\0\f6\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\4€6\2\1\0009\2\2\0023\4\3\0B\2\2\0012\0\0€K\0\1\0\0\rschedule\bvim\vassert\27\0\0\3\2\0\0\4-\0\0\0-\2\1\0B\0\2\1K\0\1\0\0À\bÀì\4\1\1\14\1\29\1[6\1\0\0009\1\1\0019\1\2\1B\1\1\2\18\4\1\0009\2\3\1'\5\4\0)\6\0\0B\2\4\1\18\4\1\0009\2\5\1B\2\2\0029\2\6\2\18\5\1\0009\3\a\1B\3\2\1\18\5\1\0009\3\b\1B\3\2\0016\3\0\0009\3\1\0039\3\t\3+\5\1\0B\3\2\0026\4\0\0009\4\1\0049\4\t\4+\6\1\0B\4\2\0025\5\v\0005\6\n\0>\3\2\6>\4\3\6=\6\f\0055\6\r\0006\a\14\0\18\t\2\0B\a\2\0?\a\0\0=\6\15\5,\6\a\0006\b\0\0009\b\1\b9\b\16\b-\n\0\0\18\v\5\0003\f\17\0B\b\4\3\18\a\t\0\18\6\b\0\14\0\6\0X\b\20€6\b\0\0009\b\18\b'\n\19\0006\v\14\0\18\r\a\0B\v\2\2&\n\v\n6\v\0\0009\v\20\v9\v\21\v9\v\22\vB\b\3\1\18\n\3\0009\b\b\3B\b\2\1\18\n\4\0009\b\b\4B\b\2\0012\0\0€K\0\1\0006\b\0\0009\b\18\b'\n\23\0\18\v\a\0&\n\v\nB\b\2\1\18\n\4\0009\b\24\0043\v\25\0B\b\3\0015\b\26\0=\2\6\b6\t\0\0009\t\27\t3\v\28\0)\fô\1B\t\3\0012\0\0€K\0\1\0\1À\0\rdefer_fn\1\0\2\thost\014127.0.0.1\ttype\vserver\0\15read_start\27codelldb started. pid=\nERROR\vlevels\blog\29Error running codelldb: \vnotify\0\nspawn\targs\rtostring\1\2\0\0\v--port\nstdio\1\0\0\1\0\0\rnew_pipe\nclose\rshutdown\tport\16getsockname\014127.0.0.1\tbind\fnew_tcp\tloop\bvim\5€€À™\4—\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\2'\1\2\0009\2\3\0003\3\5\0=\3\4\0022\0\0€K\0\1\0\0\rcodelldb\radaptersQ/Users/mpostma/.vscode/extensions/vadimcn.vscode-lldb-1.7.1/adapter/codelldb\bdap\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-hardline"] = {
    config = { "\27LJ\2\n®\6\0\0\b\0\31\0L6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\14\0005\4\6\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\t\4>\4\1\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\b\5=\5\t\4>\4\2\0035\4\f\0006\5\0\0'\a\r\0B\5\2\0029\5\b\5=\5\t\4>\4\3\0035\4\15\0>\4\5\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\18\5=\5\t\4>\4\6\0035\4\19\0006\5\0\0'\a\20\0B\5\2\0029\5\21\5=\5\t\4>\4\a\0035\4\22\0006\5\0\0'\a\20\0B\5\2\0029\5\23\5=\5\t\4>\4\b\0035\4\24\0006\5\0\0'\a\25\0B\5\2\0029\5\b\5=\5\t\4>\4\t\0035\4\26\0006\5\0\0'\a\27\0B\5\2\0029\5\b\5=\5\t\4>\4\n\0035\4\28\0006\5\0\0'\a\29\0B\5\2\0029\5\b\5=\5\t\4>\4\v\3=\3\30\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\nclass\thigh\thide\3<\30hardline.parts.whitespace\1\0\1\nclass\fwarning\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror\vstatus\15lsp-status\1\0\2\nclass\bmed\thide\3d\1\0\2\nclass\bmed\titem\a%=\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\nclass\thigh\thide\3d\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\24bufferline_settings\1\0\2\15show_index\1\21exclude_terminal\1\1\0\2\15bufferline\1\ntheme\fdefault\nsetup\rhardline\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-hardline",
    url = "https://github.com/ojroques/nvim-hardline"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n‹\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\6\0\0\trust\fclojure\fhaskell\ttoml\blua\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21rustfmt_autosave\6g\bvim\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-mergetool"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vim-mergetool",
    url = "https://github.com/samoshkin/vim-mergetool"
  },
  ["vim-sexp"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-sexp-mappings-for-regular-people"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vim-sexp-mappings-for-regular-people",
    url = "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimpeccable = {
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  },
  ["vista.vim"] = {
    config = { "\27LJ\2\nY\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\rnvim_lsp\28vista_default_executive\17nvim_set_var\bapi\bvim\0" },
    loaded = true,
    path = "/Users/mpostma/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vista.vim
time([[Config for vista.vim]], true)
try_loadstring("\27LJ\2\nY\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\rnvim_lsp\28vista_default_executive\17nvim_set_var\bapi\bvim\0", "config", "vista.vim")
time([[Config for vista.vim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n§\1\0\0\3\0\n\0\0156\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\nsetup\15catppuccin\frequire\14macchiato\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n€\1\0\1\5\3\3\1\19-\1\0\0\18\3\1\0009\1\0\1B\1\2\1-\1\1\0\18\3\1\0009\1\0\1B\1\2\1-\1\2\0\18\3\1\0009\1\0\1B\1\2\1\b\0\0\0X\1\4€6\1\1\0'\3\2\0\18\4\0\0B\1\3\1K\0\1\0\3À\4À\6€\30codelldb exited with code\nprint\nclose\0=\0\0\3\1\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0-\2\0\0B\0\2\1K\0\1\0\1À\vappend\rdap.repl\frequireL\1\2\6\0\4\0\f6\2\0\0\19\4\0\0\18\5\0\0B\2\3\1\15\0\1\0X\2\4€6\2\1\0009\2\2\0023\4\3\0B\2\2\0012\0\0€K\0\1\0\0\rschedule\bvim\vassert\27\0\0\3\2\0\0\4-\0\0\0-\2\1\0B\0\2\1K\0\1\0\0À\bÀì\4\1\1\14\1\29\1[6\1\0\0009\1\1\0019\1\2\1B\1\1\2\18\4\1\0009\2\3\1'\5\4\0)\6\0\0B\2\4\1\18\4\1\0009\2\5\1B\2\2\0029\2\6\2\18\5\1\0009\3\a\1B\3\2\1\18\5\1\0009\3\b\1B\3\2\0016\3\0\0009\3\1\0039\3\t\3+\5\1\0B\3\2\0026\4\0\0009\4\1\0049\4\t\4+\6\1\0B\4\2\0025\5\v\0005\6\n\0>\3\2\6>\4\3\6=\6\f\0055\6\r\0006\a\14\0\18\t\2\0B\a\2\0?\a\0\0=\6\15\5,\6\a\0006\b\0\0009\b\1\b9\b\16\b-\n\0\0\18\v\5\0003\f\17\0B\b\4\3\18\a\t\0\18\6\b\0\14\0\6\0X\b\20€6\b\0\0009\b\18\b'\n\19\0006\v\14\0\18\r\a\0B\v\2\2&\n\v\n6\v\0\0009\v\20\v9\v\21\v9\v\22\vB\b\3\1\18\n\3\0009\b\b\3B\b\2\1\18\n\4\0009\b\b\4B\b\2\0012\0\0€K\0\1\0006\b\0\0009\b\18\b'\n\23\0\18\v\a\0&\n\v\nB\b\2\1\18\n\4\0009\b\24\0043\v\25\0B\b\3\0015\b\26\0=\2\6\b6\t\0\0009\t\27\t3\v\28\0)\fô\1B\t\3\0012\0\0€K\0\1\0\1À\0\rdefer_fn\1\0\2\thost\014127.0.0.1\ttype\vserver\0\15read_start\27codelldb started. pid=\nERROR\vlevels\blog\29Error running codelldb: \vnotify\0\nspawn\targs\rtostring\1\2\0\0\v--port\nstdio\1\0\0\1\0\0\rnew_pipe\nclose\rshutdown\tport\16getsockname\014127.0.0.1\tbind\fnew_tcp\tloop\bvim\5€€À™\4—\1\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\2'\1\2\0009\2\3\0003\3\5\0=\3\4\0022\0\0€K\0\1\0\0\rcodelldb\radaptersQ/Users/mpostma/.vscode/extensions/vadimcn.vscode-lldb-1.7.1/adapter/codelldb\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\nŠ\2\0\0\b\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\n\0'\5\b\0'\6\v\0\18\a\1\0B\2\5\1K\0\1\0005<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\15<leader>tt\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3\4\0B\1\2\1K\0\1\0\1\0\4\16diagnostics\1\18status_symbol\5\18show_filename\1\21current_function\2\vconfig\22register_progress\15lsp-status\frequire\0", "config", "lsp-status.nvim")
time([[Config for lsp-status.nvim]], false)
-- Config for: nvim-cokeline
time([[Config for nvim-cokeline]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rcokeline\frequire\0", "config", "nvim-cokeline")
time([[Config for nvim-cokeline]], false)
-- Config for: nvim-hardline
time([[Config for nvim-hardline]], true)
try_loadstring("\27LJ\2\n®\6\0\0\b\0\31\0L6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\14\0005\4\6\0006\5\0\0'\a\a\0B\5\2\0029\5\b\5=\5\t\4>\4\1\0035\4\n\0006\5\0\0'\a\v\0B\5\2\0029\5\b\5=\5\t\4>\4\2\0035\4\f\0006\5\0\0'\a\r\0B\5\2\0029\5\b\5=\5\t\4>\4\3\0035\4\15\0>\4\5\0035\4\16\0006\5\0\0'\a\17\0B\5\2\0029\5\18\5=\5\t\4>\4\6\0035\4\19\0006\5\0\0'\a\20\0B\5\2\0029\5\21\5=\5\t\4>\4\a\0035\4\22\0006\5\0\0'\a\20\0B\5\2\0029\5\23\5=\5\t\4>\4\b\0035\4\24\0006\5\0\0'\a\25\0B\5\2\0029\5\b\5=\5\t\4>\4\t\0035\4\26\0006\5\0\0'\a\27\0B\5\2\0029\5\b\5=\5\t\4>\4\n\0035\4\28\0006\5\0\0'\a\29\0B\5\2\0029\5\b\5=\5\t\4>\4\v\3=\3\30\2B\0\2\1K\0\1\0\rsections\24hardline.parts.line\1\0\1\nclass\tmode\28hardline.parts.filetype\1\0\2\nclass\thigh\thide\3<\30hardline.parts.whitespace\1\0\1\nclass\fwarning\16get_warning\1\0\1\nclass\fwarning\14get_error\23hardline.parts.lsp\1\0\1\nclass\nerror\vstatus\15lsp-status\1\0\2\nclass\bmed\thide\3d\1\0\2\nclass\bmed\titem\a%=\1\5\0\0\0\0\0\a%<\28hardline.parts.filename\1\0\1\nclass\bmed\23hardline.parts.git\1\0\2\nclass\thigh\thide\3d\titem\rget_item\24hardline.parts.mode\1\0\1\nclass\tmode\24bufferline_settings\1\0\2\15show_index\1\21exclude_terminal\1\1\0\2\15bufferline\1\ntheme\fdefault\nsetup\rhardline\frequire\0", "config", "nvim-hardline")
time([[Config for nvim-hardline]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n‹\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\vindent\1\0\1\venable\2\14highlight\1\0\2&additional_vim_regex_highlighting\1\venable\2\21ensure_installed\1\0\0\1\6\0\0\trust\fclojure\fhaskell\ttoml\blua\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n±\a\0\0\5\0\24\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0005\4\17\0=\4\18\0035\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\1K\0\1\0\16watch_index\1\0\1\rinterval\3d\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\a\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\vbuffer\2\fnoremap\2\17n <leader>hb0<cmd>lua require\"gitsigns\".blame_line()<CR>\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\nsigns\1\0\2\nnumhl\1\18sign_priority\3\5\17changedelete\1\0\3\ttext\6~\ahl\15DiffChange\nnumhl\21GitSignsChangeNr\14topdelete\1\0\3\ttext\6_\ahl\15DiffDelete\nnumhl\21GitSignsDeleteNr\vdelete\1\0\3\ttext\bâ–Œ\ahl\15DiffDelete\nnumhl\21GitSignsDeleteNr\vchange\1\0\3\ttext\bâ–Œ\ahl\15DiffChange\nnumhl\21GitSignsChangeNr\badd\1\0\0\1\0\3\ttext\bâ–Œ\ahl\fDiffAdd\nnumhl\18GitSignsAddNr\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17integrations\1\0\1\rdiffview\2\1\0\1\tkind\16split_above\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: circles.nvim
time([[Config for circles.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcircles\frequire\0", "config", "circles.nvim")
time([[Config for circles.nvim]], false)
-- Config for: rust.vim
time([[Config for rust.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21rustfmt_autosave\6g\bvim\0", "config", "rust.vim")
time([[Config for rust.vim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-tree.lua ]]

-- Config for: nvim-tree.lua
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
