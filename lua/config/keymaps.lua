-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- quick options

map({ "i", "x" }, "jj", "<esc>", { desc = "Replace esc" })
map({ "n", "x" }, "J", "5j", { desc = "Quick down" })
map({ "n", "x" }, "K", "5k", { desc = "Quick up" })
map("n", ";", ":", { desc = "Open panel" })
map("n", "S", "<cmd>w<cr>", { desc = "Save file" })
map("n", "Q", "<cmd>q<cr>", { desc = "Exit file" })
map("n", "<leader><cr>", "<cmd>nohl<cr>", { desc = "nohl" })

-- term
map("n", "<leader>T", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open float term" })
map("n", "<leader>H", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Open horizontal term" })
map("n", "<A-3>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open float term" })
-- map("n", "<leader>h", "<cmd>ToggleTerm<cr>", { desc = "Open horizontal term" })

map("n", "<leader>ce", "<cmd>RunCpp<cr>", { desc = "Run Cpp" })
