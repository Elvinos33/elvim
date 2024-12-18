-- Base Bindings
------------------------------------------------------------------
-- Yank & Paste
vim.keymap.set("n", "<leader>YY", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })
vim.keymap.set("n", '<leader>y', '"+y', { desc = "Yank to clipboard", noremap = true })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked item under line", noremap = true })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked item above line", noremap = true })

-- Insert
vim.keymap.set("n", "<leader>i", "i<Space><ESC>i", { desc = "Enter insert mode with space in front", noremap = true })
------------------------------------------------------------------

-- Fzf.lua Bindings
------------------------------------------------------------------
local fzfLua = require("fzf-lua")

vim.keymap.set("n", "<leader>ff", fzfLua.files, {})
vim.keymap.set("n", "<leader>fg", fzfLua.live_grep_native, {})
vim.keymap.set("n", "<leader>fb", fzfLua.buffers, {})
vim.keymap.set("n", "<leader>fc", fzfLua.git_commits, {})
------------------------------------------------------------------

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
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<C-t>", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------

-- LazyGit
------------------------------------------------------------------
vim.keymap.set("n", "<leader>gg", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })
------------------------------------------------------------------

-- Remove highligts
------------------------------------------------------------------
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })
------------------------------------------------------------------

-- Flash Bindings
------------------------------------------------------------------
local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "s", flash.jump)
vim.keymap.set({ "n" }, "S", flash.treesitter)
vim.keymap.set({ "o" }, "r", flash.remote)
vim.keymap.set({ "o" }, "R", flash.treesitter_search)
vim.keymap.set({ "c" }, "<C-s>", flash.treesitter_search)
------------------------------------------------------------------
