-- Add cwd as title in terminal
vim.opt.title          = true

-- Line Number and Relative Line Number
vim.opt.number         = true
vim.opt.relativenumber = true

vim.filetype.add({ extension = { vcl = 'vcl', vtc = 'vtc' } })

-- Persistent Undo
vim.opt.undofile = true

-- Width of Tabs
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- Leader
vim.g.mapleader = " "

vim.o.background = "dark"

-- yank to clipboard
vim.opt.clipboard:prepend("unnamedplus")

-- display renames in splits (https://github.com/smjonas/inc-rename.nvim)
vim.opt.inccommand = "split"
