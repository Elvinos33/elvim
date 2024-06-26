vim.api.nvim_set_keymap('n', '<leader>ft', ':Neoformat prettier<Enter>', { noremap = true, silent = true, desc = '[F]ormat [S]ode' })

vim.g.neoformat_try_node_exe = 1

vim.cmd('autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.svelte,*.astro,*.vue,*.go :Neoformat prettier')
vim.cmd('autocmd BufWritePre *.rs :Neoformat rustfmt')
vim.cmd('autocmd BufWritePre *.tf :Neoformat terraform')
