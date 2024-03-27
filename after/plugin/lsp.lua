local lsp = require("lsp-zero").preset({})

vim.lsp.log.set_level(vim.log.levels.OFF)

lsp.ensure_installed({
    "tsserver",
    "rust_analyzer",
    "eslint",
    "clangd",
    "bashls",
    "cmake",
    "dockerls",
    "marksman",
    "zls",
    "prismals",
    "lua_ls",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ["C-p"] = cmp.mapping.select_prev_item(cmp_select),
    ["C-n"] = cmp.mapping.select_next_item(cmp_select),
    ["C-y"] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "ultisnips" },
        { name = "nvim_lua" },
        { name = "look" },
        { name = "path" },
    },
})

--[[ lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
}) ]]

local on_attach = function(client, bufnr)
    local opts = {
        buffer = bufnr,
        remap = false,
    }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
        vim.cmd("norm zz")
    end, opts)
    vim.keymap.set("n", "gD", function()
        vim.lsp.buf.declaration()
        vim.cmd("norm zz")
    end, opts)
    vim.keymap.set("n", "gi", function()
        vim.lsp.buf.implementation()
        vim.cmd("norm zz")
    end, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ck", function()
        vim.lsp.buf.hover()
    end, opts)

    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set("n", "[e", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]e", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>rs", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)
end
lsp.on_attach(on_attach)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})

lsp.setup()
