local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

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
			require('cokeline').setup {
				default_hl = {
					focused = {
						bg = "#565266",
					}
				}
			}
		end
	})
	use {
		'hoob3rt/lualine.nvim',
		config = function()
			require('lualine').setup {
				options = {
					theme = 'catppuccin'
				}
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
	use({
		"catppuccin/nvim",
		as = "catppuccin"
	})

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
	use {
		'simrat39/rust-tools.nvim',
		requires = {'neovim/nvim-lspconfig'},
		config = function()
			require'rust-tools'.setup { }
		end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup {
				snippet = {
					expand = function(args) require('luasnip').lsp_expand(args.body) end,
				},
				mapping = {
					['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-y>'] = cmp.config.disable,
					['<C-e>'] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				}, {
					{ name = 'buffer' },
				})
			}
		end
	}

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
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function() require('gitsigns').setup() end
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
