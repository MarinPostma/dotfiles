-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end 
    }
    -- Packer can manage itself
    use 'nvim-telescope/telescope.nvim'
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use { "ray-x/lsp_signature.nvim" }
    use {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "ga", require("actions-preview").code_actions)
        end,
    }
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'folke/trouble.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "rust", "javascript" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
            }
        end
    
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'voldikss/vim-floaterm'
    use{
        'scalameta/nvim-metals', 
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("metals").bare_config()
        end
    }
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim', config = function() require('neogit').setup{} end }
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require'gitsigns'.setup{} end
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = function() require'nvim-tree'.setup{} end

    }
    use { 'terrortylor/nvim-comment', config = function() require'nvim_comment'.setup{} end }
    use { "catppuccin/nvim", as = "catppuccin", config = function() require'catppuccin'.setup {
                flavour = "macchiato", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                light = "latte",
                dark = "macchiato",
            },
            transparent_background = false, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
            comments = { "italic" }, -- Change the style of comments
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = { "bold" },
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = false,
	    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	    },
	} end
	}
    -- use 'Olical/conjure'
end)
