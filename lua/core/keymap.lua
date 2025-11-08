-- Base Bindings: Common operations for efficient text editing and navigation in Neovim
------------------------------------------------------------------

--- Yank & Paste: Simplified clipboard operations
--- Copy the entire buffer to the system clipboard
vim.keymap.set("n", "<leader>yy", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })

--- Remove highlights: Clear search highlights from the current buffer
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })

------------------------------------------------------------------

-- LSP Bindings: Keymaps for Language Server Protocol interactions
------------------------------------------------------------------
--- Jump to the declaration of the symbol under the cursor
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
--- Jump to the definition of the symbol under the cursor
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
--- Display hover information about the symbol under the cursor
vim.keymap.set("n", "K", vim.lsp.buf.hover)
--- Jump to the type definition of the symbol under the cursor
vim.keymap.set("n", "<C-t>", vim.lsp.buf.type_definition)
--- Rename the symbol under the cursor
vim.keymap.set("n", "<leader>rn", ":IncRename ")
------------------------------------------------------------------

-- Diagnostics: Navigation and display of diagnostic messages
------------------------------------------------------------------
--- Jump to the next diagnostic error message in the buffer
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
--- Open a floating window with the diagnostic message under the cursor
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------
