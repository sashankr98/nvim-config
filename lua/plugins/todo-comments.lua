return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
        highlight = {
            pattern = [[.*<(KEYWORDS)\s*]],
        },
        keywords = {
            TODO = {
                alt = { "Todo", "todo", "ToDo", "toDo" },
            },
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>to", ":TodoTelescope<CR>")
    end,
}
