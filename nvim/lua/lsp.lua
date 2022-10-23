vim.o.completeopt = "menu,menuone,noselect"
vim.o.updatetime=1000

-- nvim_lsp object
local nvim_lsp = require'lspconfig'
local lsp_status = require'lsp-status'
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

local on_attach = function(client)
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = true -- 0.8 and later
    end
end

local capabilities = vim.tbl_extend('keep', {}, lsp_status.capabilities)

nvim_lsp.hls.setup { handlers=handlers }
nvim_lsp.tsserver.setup({ handlers = handlers, capabilities = capabilities, on_attach = on_attach })
nvim_lsp.sumneko_lua.setup {
    capabilities = capabilities,
    handlers=handlers,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- rust config
vim.opt.completeopt = "menu,menuone,noinsert"


-- Setup cmp
do
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local cmp = require("cmp")
    local luasnip = require("luasnip")
    cmp.setup({
        mapping = cmp.mapping.preset.insert({ -- Preset: ^n, ^p, ^y, ^e, you know the drill..
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lsp_signature_help" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "path" },
            }, {
                { name = "buffer", keyword_length = 3 },
        }),
    })

    -- Setup buffer-local keymaps / options for LSP buffers
    local caps = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local lsp_attach = function(client, buf)
        -- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
        -- or a plugin like which-key.nvim
        -- <lhs>        <rhs>                        <desc>
        -- "K"          vim.lsp.buf.hover            "Hover Info"
        -- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
        -- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
        -- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
        -- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
        -- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
        -- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
        -- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
        -- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
        -- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"

        vim.api.nvim_buf_set_option(buf, "formatexpr", "v:lua.vim.lsp.formatexpr()")
        vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")
        vim.api.nvim_buf_set_option(buf, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    -- Setup rust_analyzer via rust-tools.nvim
    require("rust-tools").setup({
        server = {
            capabilities = caps,
            on_attach = lsp_attach,
        }
    })

    -- Keymaps for Luasnip
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end, { silent = true })

    vim.keymap.set("i", "<C-l>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end)
end
