-- Add cwd as title in terminal
vim.opt.title = true

-- Line Number and Relative Line Number
vim.opt.number = true
vim.opt.relativenumber = true

vim.filetype.add({ extension = { vcl = "vcl", vtc = "vtc" } })

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

-- case sensitive if search string includes uppercase
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- LSP Diagnostics updatetime 300 ms
vim.opt.updatetime = 300

-- noice manages most of it, but for those it does not
vim.opt.cmdheight = 0
