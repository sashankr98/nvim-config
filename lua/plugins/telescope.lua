return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            "nvim-telescope/telescope-ui-select.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        opts = {
            pickers = {
                find_files = {
                    previewer = false,
                }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            }
        },
        init = function()
            require("telescope").load_extension("ui-select")
        end,
        keys = {
            { "<leader>f",  "<cmd>Telescope find_files<cr>" },
            { "<leader>g",  "<cmd>Telescope live_grep<cr>" },
            { "<leader>i",  "<cmd>Telescope help_tags<cr>" },
            -- { "<leader>ss", "<cmd>Telescope git_status<cr>" },
            { "<leader>m", "<cmd>Telescope marks<cr>" },
        }
    }
}
