vim.cmd [[packadd packer.nvim]]
--vim.cmd [[packadd packer.vimspector]]
return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'norcalli/nvim-base16.lua'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'tpope/vim-fugitive'
	use 'windwp/nvim-autopairs'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'galaxyline-settings' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'neovim/nvim-lspconfig'
	use 'nvim-lua/lsp_extensions.nvim'
	use 'hrsh7th/nvim-compe'
	use 'tpope/vim-surround'
	use 'voldikss/vim-floaterm'
	use 'preservim/nerdcommenter'
	use 'onsails/lspkind-nvim'
	use {
		'pwntester/octo.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope.nvim'}
		}
	}
	use 'junegunn/fzf.vim'
	use {
		'junegunn/fzf',
		run = function() vim.fn['fzf#install'](0) end,
	}
	use 'mhartington/oceanic-next'
	use 'Yggdroot/indentLine'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'mfussenegger/nvim-dap'
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}
	use 'akinsho/nvim-bufferline.lua'
	use 'hrsh7th/vim-vsnip'
	use 'hrsh7th/vim-vsnip-integ'
	use 'ARM9/arm-syntax-vim'
	use 'rust-lang/rust.vim'
	use 'ayu-theme/ayu-vim'
	use "ray-x/lsp_signature.nvim"
	use 'mhinz/vim-startify'
	use 'puremourning/vimspector'
end)
