vim.g.mapleader = " "


--Fzf.lua Bindings
------------------------------------------------------------------
local fzfLua = require('fzf-lua')

vim.keymap.set('n', '<leader>ff', fzfLua.files, {})
vim.keymap.set('n', '<leader>fg', fzfLua.live_grep, {})
vim.keymap.set('n', '<leader>fb', fzfLua.buffers, {})

------------------------------------------------------------------

--Oil Bindings
------------------------------------------------------------------
vim.keymap.set('n', '<leader>o', ":Oil<CR>", { desc = 'Toggle Oil' })
------------------------------------------------------------------

--LSP Bindings
------------------------------------------------------------------
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to definition' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to declaration' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set('n', '<C-t>', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
------------------------------------------------------------------

--Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message ([E]rror message)"})
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message"})
------------------------------------------------------------------

--Copilot Bindings
------------------------------------------------------------------
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
------------------------------------------------------------------

