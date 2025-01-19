return {
    { 'nvim-telescope/telescope.nvim', lazy = true },
    { 'neovim/nvim-lspconfig', lazy = false },
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set({ "v", "n" }, "ga", require("actions-preview").code_actions)
        end,
    },
    { 'folke/trouble.nvim', lazy = false },
    { 'mrcjkb/rustaceanvim', lazy = false },
    { 'rust-lang/rust.vim', lazy = true },
    { 'hrsh7th/cmp-nvim-lsp', lazy = false },
    { 'hrsh7th/cmp-buffer', lazy = false },
    { 'hrsh7th/cmp-path', lazy = false },
    { 'hrsh7th/cmp-cmdline', lazy = false },
    { 'hrsh7th/nvim-cmp', lazy = false },
    { 'L3MON4D3/LuaSnip', lazy = false },
    { 'saadparwaiz1/cmp_luasnip', lazy = false },
    { 'junegunn/fzf', lazy = false },
    { 'junegunn/fzf.vim', lazy = false },
    { 'justinmk/vim-sneak', lazy = false },
    { 'voldikss/vim-floaterm', lazy = false },
    { 'LnL7/vim-nix', lazy = true },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "rust", "javascript", "python" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                }
            }
        end
   
    },
    {
        "windwp/nvim-autopairs",
        lazy = false,
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        lazy = false,
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        'NeogitOrg/neogit',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function() 
            require('neogit').setup{}
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = false,
        config = function() require'gitsigns'.setup{} end
    },
    {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function() require'nvim-tree'.setup{} end
    },
    { 
        'terrortylor/nvim-comment',
        config = function()
            require'nvim_comment'.setup{}
        end
    },
    {
        'stevearc/oil.nvim',
        config = function() require("oil").setup {
            view_options = {
                show_hidden = true,
            }
        } 
        end 
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        config = function() 
            -- set the theme according to system theme
            vim.opt.background="dark"
            require'catppuccin'.setup {
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                -- background = { -- :h background
                --     light = "latte",
                --     dark = "mocha",
                -- },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
                dim_inactive = {
                    enabled = true, -- dims the background color of inactive window
                    shade = "dark",
                    percentage = 0.15, -- percentage of the shade to apply to the inactive window
                },
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    loops = { "bold" },
                    functions = { "bold" },
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
            } 
        end
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
            local rainbow_delimiters = require 'rainbow-delimiters'

            ---@type rainbow_delimiters.config
            vim.g.rainbow_delimiters = {
                strategy = {
                    [''] = rainbow_delimiters.strategy['global'],
                    vim = rainbow_delimiters.strategy['local'],
                },
                query = {
                    [''] = 'rainbow-delimiters',
                    lua = 'rainbow-blocks',
                },
                priority = {
                    [''] = 110,
                    lua = 210,
                },
                highlight = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterCyan',
                },
            }
        end
    },
    {
        "linrongbin16/gitlinker.nvim",
        cmd = "GitLink",
        opts = {},
        keys = {
            { "<leader>gy", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
            { "<leader>gY", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
        },
    },
}
