-- Unmapping
------------------------------------------------------------------
vim.api.nvim_set_keymap('n', 'q:', '<Nop>', { noremap = true, silent = true })
------------------------------------------------------------------

-- Base Bindings
------------------------------------------------------------------
-- Yank & Paste
vim.keymap.set("n", "<leader>YY", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })
vim.keymap.set("n", '<leader>y', '"+y', { desc = "Yank to clipboard", noremap = true })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked item under line", noremap = true })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked item above line", noremap = true })

-- Oil Bindings
------------------------------------------------------------------
local oil = require("oil")

vim.keymap.set("n", "<leader>o", oil.open, { desc = "Toggle Oil" })
------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------

-- Remove highligts
------------------------------------------------------------------
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })
------------------------------------------------------------------

-- Harpoon Bindings
------------------------------------------------------------------
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
------------------------------------------------------------------

-- AI Stuff
------------------------------------------------------------------
vim.keymap.set("v", "<leader>gl", "<CMD>'<,'>CodeCompanion<CR>", { desc = "Open Codecompanion", noremap = true })
vim.keymap.set("n", "<leader>gl", "<CMD>CodeCompanion<CR>", { desc = "Open Codecompanion", noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>gh", "<CMD>CodeCompanionChat toggle<CR>", { desc = "Open Codecompanion" })

-- Window Navigation
------------------------------------------------------------------
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })
------------------------------------------------------------------
