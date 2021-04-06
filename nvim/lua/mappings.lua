vim.api.nvim_set_keymap('n', '<Leader>g', ':G <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':G commit<CR>', { noremap = true, silent = true })

-- Window movements
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true, silent = true })

-- Fuzzy find
vim.api.nvim_set_keymap('n', '<leader>p', ":Files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>f', ":Rg<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], { noremap = true, silent = true })

-- tools
vim.api.nvim_set_keymap('n', '<F5>', ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- lsp mappings
vim.api.nvim_set_keymap('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ga', "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'K', "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-]>', "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gD', "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '1gD', "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'g0', "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'rn', "<cmd>lua vim.lsp.buf.rename()<cr>", { noremap = true, silent = true })

-- Quickfix mappings
vim.api.nvim_set_keymap('n', '<leader>n', ":cnext<CR>", { noremap = true, silent = true })
