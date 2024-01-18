vim.api.nvim_set_keymap('n', '<leader>ft', ':Neoformat prettier<Enter>', { noremap = true, silent = true, desc = '[F]ormat [S]ode' })

vim.cmd('autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.svelte,*.astro,*.vue :Neoformat prettier')
