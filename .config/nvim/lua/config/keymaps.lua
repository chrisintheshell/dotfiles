-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Your custom keymaps
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "x", '"_x', { desc = "Delete without updating register", noremap = true })

-- ⌥ + Delete: delete the word to the left of the insertion point (insert mode)
map("i", "<M-BS>", "<C-w>", { desc = "Delete word left" })

-- ⌘ + Delete: delete text from the insertion point to the beginning of the line (insert mode)
map("i", "<C-k>", "<C-u>", { desc = "Delete to beginning of line" })
