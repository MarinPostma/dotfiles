--local base16 = require "base16"
--base16(base16.themes["gruvbox-dark-hard"], true)

vim.api.nvim_set_keymap('n', '<Leader>nt', ":lua cycle_theme() <CR>", { noremap = true, silent = true })

vim.o.termguicolors = true
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.o.swapfile = false
vim.wo.cursorline = true

-- search features
vim.o.inccommand = 'nosplit'
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true
vim.o.hidden = true

vim.g.floaterm_keymap_toggle = '<F12>'

vim.api.nvim_exec([[
syntax enable
filetype plugin indent on
"remove trailing whitespaces"
autocmd BufWritePre * %s/\s\+$//e

colorscheme nightfly
let g:nightflyNormalFloat = 1
let g:nightflyUnderlineMatchParen = 1
]], false);

vim.api.nvim_set_var('indent_blankline_char_list', {"¦"})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
vim.lsp.handlers.hover, {
	border = {
		{'┌', 'FloatBorder'},
		{'─', 'FloatBorder'},
		{'┐', 'FloatBorder'},
		{'│', 'FloatBorder'},
		{'┘', 'FloatBorder'},
		{'─', 'FloatBorder'},
		{'└', 'FloatBorder'},
		{'│', 'FloatBorder'}
	}
}
)

vim.api.nvim_exec([[
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

let g:vim_markdown_no_extensions_in_markdown = 1
]], false)

