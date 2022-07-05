vim.o.completeopt = "menu,menuone,noselect"
vim.o.updatetime=1000

-- nvim_lsp object
local nvim_lsp = require'lspconfig'
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, focusable=false, scope="cursor"})]]

local border = {
			{'┌', 'FloatBorder'},
			{'─', 'FloatBorder'},
			{'┐', 'FloatBorder'},
			{'│', 'FloatBorder'},
			{'┘', 'FloatBorder'},
			{'─', 'FloatBorder'},
			{'└', 'FloatBorder'},
			{'│', 'FloatBorder'}
		}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

nvim_lsp.hls.setup { handlers=handlers }
nvim_lsp.clojure_lsp.setup {}
nvim_lsp.clangd.setup{}
nvim_lsp.pylsp.setup {}
nvim_lsp.tsserver.setup{ handlers = handlers }
