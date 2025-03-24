require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "x", '\"_x', { desc = "remap x to delete but not update default register", noremap = true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
