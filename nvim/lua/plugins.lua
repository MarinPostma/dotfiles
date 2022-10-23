local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'nvim-telescope/telescope.nvim'
    use 'wbthomason/packer.nvim'
    use {
        'liuchengxu/vista.vim',
        config = function()
            vim.api.nvim_set_var("vista_default_executive", "nvim_lsp")
        end
    }
    use { 'svermeulen/vimpeccable' }
    use  {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require('dap')
            local cmd = '/Users/mpostma/.vscode/extensions/vadimcn.vscode-lldb-1.7.1/adapter/codelldb'
            dap.adapters.codelldb = function(on_adapter)
                -- This asks the system for a free port
                local tcp = vim.loop.new_tcp()
                tcp:bind('127.0.0.1', 0)
                local port = tcp:getsockname().port
                tcp:shutdown()
                tcp:close()

                -- Start codelldb with the port
                local stdout = vim.loop.new_pipe(false)
                local stderr = vim.loop.new_pipe(false)
                local opts = {
                    stdio = {nil, stdout, stderr},
                    args = {'--port', tostring(port)},
                }
                local handle
                local pid_or_err
                handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
                    stdout:close()
                    stderr:close()
                    handle:close()
                    if code ~= 0 then
                        print("codelldb exited with code", code)
                    end
                end)
                if not handle then
                    vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
                    stdout:close()
                    stderr:close()
                    return
                end
                vim.notify('codelldb started. pid=' .. pid_or_err)
                stderr:read_start(function(err, chunk)
                    assert(not err, err)
                    if chunk then
                        vim.schedule(function()
                            require("dap.repl").append(chunk)
                        end)
                    end
                end)
                local adapter = {
                    type = 'server',
                    host = '127.0.0.1',
                    port = port
                }
                -- 💀
                -- Wait for codelldb to get ready and start listening before telling nvim-dap to connect
                -- If you get connect errors, try to increase 500 to a higher value, or check the stderr (Open the REPL)
                vim.defer_fn(function() on_adapter(adapter) end, 500)
            end
        end
    }
    use { "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function() require("dapui").setup{} end
    }
    -- languages
    use {
        'rust-lang/rust.vim',
        config = function()
            vim.g.rustfmt_autosave = true
        end
    }
    use 'neovimhaskell/haskell-vim'
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup{} end
    }
    use 'tpope/vim-surround'
    use 'guns/vim-sexp'
    use 'tpope/vim-sexp-mappings-for-regular-people'
    -- Theming
    use({
        'noib3/nvim-cokeline',
        requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
        config = function()
            require('cokeline').setup { }
        end
    })
    use {
        "nvim-lua/lsp-status.nvim",
        requires = 'neovim/nvim-lspconfig',
        config = function()
            local lsp_status = require'lsp-status'
            lsp_status.register_progress()
            lsp_status.config({
                current_function = true,
                show_filename = false,
                status_symbol = '',
                diagnostics = false,
            })
        end


    }
    use {
        'ojroques/nvim-hardline',
        requires = "nvim-lua/lsp-status.nvim",
        config = function()
            require('hardline').setup {
                bufferline = false,  -- enable bufferline
                bufferline_settings = {
                    exclude_terminal = false,  -- don't show terminal buffers in bufferline
                    show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
                },
                theme = 'default',   -- change theme
                sections = {         -- define sections
                    {class = 'mode', item = require('hardline.parts.mode').get_item},
                    {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
                    {class = 'med', item = require('hardline.parts.filename').get_item},
                    '%<',
                    {class = 'med', item = '%='},
                    {class = 'med', item = require('lsp-status').status, hide = 100},
                    {class = 'error', item = require('hardline.parts.lsp').get_error},
                    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
                    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
                    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60},
                    {class = 'mode', item = require('hardline.parts.line').get_item},
                },
            }
        end
    }
    use {
        'junegunn/fzf.vim',
        requires = 'junegunn/fzf'
    }
    use {
        'kyazdani42/nvim-tree.lua',
        after = 'circles.nvim',
        config = function() require'nvim-tree'.setup {} end
    }

    -- theme
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
			require("catppuccin").setup()
			vim.api.nvim_command "colorscheme catppuccin"
		end
	}
    -- 	-- lsp
    use {
    'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = 'p00f/nvim-ts-rainbow',

        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {
                    "rust",
                    "clojure",
                    "haskell",
                    "toml",
                    "lua",
                }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                rainbow = {
                    enable = true,
                    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                    max_file_lines = nil, -- Do not enable for files with more than n lines, int
                    -- colors = {}, -- table of hex strings
                    -- termcolors = {} -- table of colour name strings
                }
            }
        end
    }
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'simrat39/rust-tools.nvim'

    -- Git
    use {
        'TimUntersberger/neogit',
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim'
},
        config = function() require'neogit'.setup{
            kind = "split_above",
            integrations = {
                diffview = true,
            }
        } end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup {
            signs = {
                add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
                change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
                delete = {hl = "DiffDelete", text = "▌", numhl = "GitSignsDeleteNr"},
topdelete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
            },
            numhl = false,
            keymaps = {
                -- Default keymap options
                noremap = true,
                                buffer = true,
["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
            },
            watch_index = {
                interval = 100
            },
            sign_priority = 5,
            status_formatter = nil -- Use default
        }
        end
    }
    use 'samoshkin/vim-mergetool'
    use {
        "projekt0n/circles.nvim",
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function() require("circles").setup() end
    }
    use {
        'numToStr/FTerm.nvim',
config = function()
            require'FTerm'.setup { }
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            map('n', '<leader>tt', '<CMD>lua require("FTerm").toggle()<CR>', opts)
            map('t', '<leader>tt', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
        end
}
use {
    'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
