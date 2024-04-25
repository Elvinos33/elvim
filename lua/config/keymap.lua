vim.g.mapleader = " "


--Telescope Bindings
------------------------------------------------------------------
local telescopeBuiltin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, {})

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
vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
------------------------------------------------------------------

