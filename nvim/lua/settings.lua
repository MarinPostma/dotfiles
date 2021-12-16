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

vim.cmd[[colorscheme catppuccin]]

vim.g.floaterm_keymap_toggle = '<F12>'

vim.api.nvim_exec([[
syntax enable
filetype plugin indent on
"remove trailing whitespaces"
autocmd BufWritePre * %s/\s\+$//e
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
set termguicolors
set grepprg=rg\ --vimgrep
]], false);
