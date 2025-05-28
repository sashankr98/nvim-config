return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            local config = require('nvim-treesitter.configs')
            config.setup({
                auto_install = true,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    }
}
