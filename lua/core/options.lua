-- ============================================================================
-- Core Neovim Options Configuration
-- ============================================================================

-- Leader key (must be set before plugins are loaded)
vim.g.mapleader = " "

-- ============================================================================
-- UI and Display Options
-- ============================================================================

-- Terminal title configuration
vim.opt.title = true
vim.opt.titlestring = "nvim: %t"

-- Line numbers
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Color scheme
vim.opt.background = "dark"

-- Remove tildes on empty lines
vim.opt.fillchars = { eob = " " }

-- Update time for various operations (CursorHold, swap file writing, etc.)
vim.opt.updatetime = 300

-- ============================================================================
-- Editor Behavior
-- ============================================================================

-- Persistent undo across sessions
vim.opt.undofile = true

-- Search behavior
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true  -- Override ignorecase if search contains uppercase

-- Command line completion
vim.opt.inccommand = "split" -- Display renames in splits (useful for inc-rename.nvim)

-- ============================================================================
-- Indentation and Tabs
-- ============================================================================

vim.opt.shiftwidth = 2   -- Number of spaces for each indentation level
vim.opt.tabstop = 2      -- Number of spaces a tab counts for
vim.opt.softtabstop = 2  -- Number of spaces a tab counts for while editing
vim.opt.expandtab = true -- Convert tabs to spaces

-- ============================================================================
-- Clipboard Integration
-- ============================================================================

-- Use system clipboard for yank/paste operations
vim.opt.clipboard:prepend("unnamedplus")

-- ============================================================================
-- File Type Detection
-- ============================================================================

-- Add custom file type associations
vim.filetype.add({
  extension = {
    vcl = 'vcl', -- Varnish Configuration Language
    vtc = 'vtc'  -- Varnish Test Case
  }
})
