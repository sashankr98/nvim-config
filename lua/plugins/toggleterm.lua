local direction = "horizontal"
if vim.o.columns >= 200 then
    direction = "vertical"
end

return {
    "akinsho/toggleterm.nvim",
    enabled = false,
    version = "*",
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return 20
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.5
            end
        end,
        open_mapping = "<leader>tt",
        insert_mappings = false,
        terminal_mappings = false,
        persist_mode = false,
        direction = direction,
    },
    init = function()
        vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
            on_open = function(term)
                vim.cmd("startinsert!")
                -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
                -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<Esc>", { noremap = true, silent = true })
            end,
            on_close = function()
                vim.cmd("startinsert!")
            end,
            close_on_exit = true,
        })
        local function lazygit_toggle()
            lazygit:toggle()
        end
        vim.keymap.set("n", "<leader>ss", lazygit_toggle, { noremap = true, silent = true })
    end,
}
