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
set expandtab
set shiftwidth=4
set smartindent
"remove trailing whitespaces"
autocmd BufWritePre * %s/\s\+$//e
autocmd FileType typescript setlocal ts=4 sts=4 sw=4
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
set termguicolors
set grepprg=rg\ --vimgrep
]], false);
