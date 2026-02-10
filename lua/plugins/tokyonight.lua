return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("tokyonight")
    end,
    opts = {
        style = "night",
        on_colors = function(colors)
            colors.bg = "#0B0E14"
        end
    }
}
