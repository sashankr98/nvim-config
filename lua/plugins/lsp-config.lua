vim.filetype.add({
    filename = {
        ["docker-compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["compose.yaml"] = "yaml.docker-compose",
    },
})

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "eslint",
                    "jsonls",
                    "yamlls",
                    "dockerls",
                    "docker_compose_language_service"
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "luvit-meta/library", words = { "vim%.uv" } }
                    }
                }
            }
        },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config('*', {
                root_markers = { '.git' },
                capabilities = capabilities,
            })

            vim.lsp.config('ts_ls', {
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = "relative",
                        importModuleSpecifierEnding = "minimal",
                    },
                },
                root_markers = { "package.json" },
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end,
            })

            vim.lsp.config('eslint', {
                root_markers = { "package.json" },
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = true
                end,
            })

            vim.lsp.config('yamlls', {
                settings = {
                    yaml = {
                        format = {
                            enable = true,
                        }
                    }
                },
                filetypes = { 'yaml' }
            })
        end,
        keys = {
            { "gd",         vim.lsp.buf.definition },
            { "gi",         vim.lsp.buf.implementation },
            { "gr",         vim.lsp.buf.references },
            { "<leader>ca", vim.lsp.buf.code_action,   mode = { "n", "v" } },
            { "<M-r>",      vim.lsp.buf.rename },
            { "<M-F>",      vim.lsp.buf.format },
        }
    },
}
