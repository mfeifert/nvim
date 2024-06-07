return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        require("luasnip.loaders.from_vscode").lazy_load()

        lspconfig.lua_ls.setup({
            capabilities = capabilities
        })
        lspconfig.gopls.setup({
            capabilities = capabilities
        })
        lspconfig.pylsp.setup({
            capabilities = capabilities
        })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', '<Leader>ld', vim.diagnostic.open_float, {})
        vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, {})

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "gopls", "pylsp" }
        })

        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                    { name = 'buffer' },
                })
        })
    end
}
