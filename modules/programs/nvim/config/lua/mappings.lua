vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<Leader>g', ':lua require("neogit").open()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gm', ':MergetoolToggle<CR>', { noremap = true, silent = true })

-- Window movements
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true, silent = true })

-- Fuzzy find
vim.api.nvim_set_keymap('n', '<C-f>', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-b>", ":Telescope buffers<cr>", { noremap = true, silent = true })

-- tools
vim.api.nvim_set_keymap('n', '<leader>fs', ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- lsp mappings
vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'ga', "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-]>', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '1gD', "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gre', "<cmd>lua vim.lsp.buf.references()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'grn', "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })

-- Vista mappings
vim.api.nvim_set_keymap('n', '<C-s>', ":Vista finder<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>st', ":Vista!!<CR>", { noremap = true, silent = true })

-- Quickfix mappings
vim.api.nvim_set_keymap('n', '<leader>n', ":cnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ":cprev<CR>", { noremap = true, silent = true })

-- subst
vim.api.nvim_set_keymap('v', '<leader>ss', ":s/", { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<leader>ss', ":%s/", { noremap = true, silent = false })

-- toggle floatingh terminal
vim.api.nvim_set_keymap('n', '<leader>tt', ":FloatermToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>tt', "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })

-- git
vim.api.nvim_set_keymap('n', '<leader>bl', ":Gitsigns blame_line<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cf', ":GitConflictListQf<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gco', ":GitConflictChooseOurs<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gct', ":GitConflictChooseTheirs<CR>", { noremap = true, silent = true })
