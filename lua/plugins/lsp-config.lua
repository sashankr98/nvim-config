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
        "neovim/nvim-lspconfig",
        dependencies = { "nvim-telescope/telescope.nvim" },
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config('*', {
                root_markers = { '.git' },
                capabilities = capabilities,
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
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        opts = {
            automatic_enable = true,
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "eslint",
                "jsonls",
                "dockerls",
                "docker_compose_language_service"
            }
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    }
}
