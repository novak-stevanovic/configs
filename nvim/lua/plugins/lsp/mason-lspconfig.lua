return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        local mason = require("mason")
        mason.setup()
        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = {
                "clangd",
                "html",
                "cssls",
                "lua_ls",
                "jsonls",
                "bashls",
                "pyright",
                "jdtls",
                "omnisharp",
                "cmake"
            },
            auto_install = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                        on_attach = On_attach
                    })
                end,

                ["clangd"] = function()
                    require('lspconfig').clangd.setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                        on_attach = On_attach_workspace,
                    })
              end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                        on_attach = On_attach,
                        on_init = function(client)
                            local path = client.workspace_folders[1].name
                            if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                                return
                            end

                            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                                runtime = { version = 'LuaJIT' },
                                workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
                            })
                        end,
                        settings = {
                            Lua = {}
                        }
                    })
                end,

                ["cssls"] = function()
                    vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true

                    require("lspconfig").cssls.setup {
                        on_attach = On_attach,
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    }
                end,
                ["jdtls"] = function() end,
            }

        })
    end
}
