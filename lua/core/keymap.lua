-- Base Bindings
------------------------------------------------------------------

--- Yank & Paste
vim.keymap.set("n", "<leader>yy", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })

--- Escape
vim.keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode with jk", noremap = true })

--- Remove highligts
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })

------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------
