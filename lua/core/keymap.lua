-- Base Bindings
------------------------------------------------------------------

--- Yank & Paste
vim.keymap.set("n", "<leader>yy", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked item under line", noremap = true })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked item above line", noremap = true })

--- Remove highligts
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })


-- vim.keymap.set("n", "<c-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move cursor left" })
-- vim.keymap.set("n", "<c-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move cursor down" })
-- vim.keymap.set("n", "<c-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move cursor up" })
-- vim.keymap.set("n", "<c-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move cursor right" })

------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to definition" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-t>", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", ":IncRename ")
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------
