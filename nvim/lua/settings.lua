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
vim.opt.updatetime = 750

vim.g.floaterm_keymap_toggle = '<F12>'
-- vim.g.rustfmt_autosave = true

vim.api.nvim_exec([[
syntax enable
filetype plugin indent on
set expandtab
set shiftwidth=4
set smartindent
autocmd FileType typescript setlocal ts=4 sts=4 sw=4
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7
set termguicolors
set grepprg=rg\ --vimgrep
set mouse=
]], false);
