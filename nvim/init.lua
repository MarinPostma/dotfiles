require('mappings')
require('plugins')
require('settings')

require('telescope-settings')
require('treesitter-settings')
require('galaxyline-settings')
require('lsp')
require('gitsigns-config')
require('bufferline-config')

require("lspkind").init(
    {
        File = " "
    }
)
require('nvim-autopairs').setup()
require 'lsp_signature'.on_attach()

require 'termdebug'
--require 'lushtheme'
