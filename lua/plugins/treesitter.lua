return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        opts = {
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }
        },
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.11") == 1,
    }
}
