return {
    -- Autocompletion plugin
    {"hrsh7th/nvim-cmp",
        opts = function()
            local cmp = require("cmp")
            return {
                snippet = {expand = function(args) require('luasnip').lsp_expand(args.body) end},
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({select = true})
                }),
                -- completion = {keyword_length = 1, keyword_pattern = ".*"},
                sources = cmp.config.sources({
                    {name = 'nvim_lsp', keyword_length = 1},
                    {name = 'luasnip'}},
                    {{name = 'buffer', option = {get_bufnrs = function() return vim.api.nvim_list_bufs() end}}
                    })
            }
        end,
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",

    -- snippets
    {"L3MON4D3/LuaSnip",
        config = function()
            local luasnip = require("luasnip")
            luasnip.filetype_extend("zsh", {"sh"})
        end,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
                require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
            end,
        },
    },
    "saadparwaiz1/cmp_luasnip",
}
