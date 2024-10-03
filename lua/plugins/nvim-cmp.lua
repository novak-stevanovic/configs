return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
            config = function()
                local ls = require("luasnip")
                vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
                vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
                --vim.keymap.set({"i", "s"}, "<A-p>", function() ls.jump(-1) end, {silent = true}) NE RADI

                -- vim.keymap.set({"i", "s"}, "<C-E>", function()
                --     if ls.choice_active() then
                --         ls.change_choice(1)
                --     end
                -- end, {silent = true})
            end
        },
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/my-snippets" } })

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = 'nvim_lsp_signature_help' }
            })
    })
    end
}
