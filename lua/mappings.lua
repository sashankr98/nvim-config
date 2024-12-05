vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader>w", ":w<CR>", {})

-- Buffer actions
vim.keymap.set("n", "<leader>bd", ":bwipeout<CR>", {})
vim.keymap.set("n", "L", ":bnext<CR>", {})
vim.keymap.set("n", "H", ":bprev<CR>", {})

-- Window actions
vim.keymap.set("n", "<leader>k", "<C-w>k", {})
vim.keymap.set("n", "<leader>j", "<C-w>j", {})
vim.keymap.set("n", "<leader>h", "<C-w>h", {})
vim.keymap.set("n", "<leader>l", "<C-w>l", {})
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", {})
vim.opt.splitright = true

-- Add lines in normal mode
vim.keymap.set("n", "<M-CR>", "o<ESC>", {})
vim.keymap.set("n", "<M-S-CR>", "O<ESC>", {})

-- Pair handling
local handle_pair_inline = function (pair_str)
    vim.keymap.set("i", pair_str, pair_str.."<ESC><Insert>", {})
end

local inline_pairs = {
    "()",
    "[]",
    "\"\"",
    "''",
    "``",
}

for _, pair in pairs(inline_pairs) do
    handle_pair_inline(pair)
end

vim.keymap.set("i", "()", "()<ESC><left>a", {})
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O", {})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})

-- Lua
vim.keymap.set("n", "<leader><leader>x", ":source %<CR>", {})
vim.keymap.set("n", "<leader>x", ":.lua<CR>", {})
vim.keymap.set("v", "<leader>x", ":lua<CR>", {})
