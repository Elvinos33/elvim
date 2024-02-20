vim.g.mapleader = " "


--Telescope Bindings
------------------------------------------------------------------
local telescopeBuiltin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescopeBuiltin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags, {})

------------------------------------------------------------------

--Netrw Bindings
------------------------------------------------------------------
vim.keymap.set('n', '<leader>ew', ':Ex<CR>', {})
------------------------------------------------------------------

--LSP Bindings
------------------------------------------------------------------
vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { desc = 'Go to definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
------------------------------------------------------------------

--Copilot Bindings
------------------------------------------------------------------
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
------------------------------------------------------------------

