vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}
	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use 'chriskempson/base16-vim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
	use 'jiangmiao/auto-pairs'
	use 'airblade/vim-gitgutter'
	use 'tpope/vim-fugitive'
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
	use 'nvim-lua/completion-nvim'
	use 'tpope/vim-surround'
	use 'voldikss/vim-floaterm'
	use 'preservim/nerdcommenter'
	use 'sheerun/vim-polyglot'
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
	use 'mfussenegger/nvim-dap'
end)
