-- Base Bindings
------------------------------------------------------------------

--- Yank & Paste
vim.keymap.set("n", "<leader>yy", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked item under line", noremap = true })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked item above line", noremap = true })

--- Escape
vim.keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode with jk", noremap = true })

--- Remove highligts
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })


------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<C-t>", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", ":IncRename ")
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------
