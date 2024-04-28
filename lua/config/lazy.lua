-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
   'williamboman/mason.nvim',
   'williamboman/mason-lspconfig.nvim',
   'neovim/nvim-lspconfig',
   'hrsh7th/nvim-cmp',
   'hrsh7th/cmp-nvim-lsp',
   'L3MON4D3/LuaSnip',
   'saadparwaiz1/cmp_luasnip',
   'rafamadriz/friendly-snippets',
   'nvim-treesitter/nvim-treesitter',
   'ellisonleao/gruvbox.nvim',
   'andweeb/presence.nvim',
   'github/copilot.vim',
   'sbdchd/neoformat',
   'tpope/vim-fugitive',
   'christoomey/vim-tmux-navigator',
   {
      'stevearc/oil.nvim',
      opts = {},
      -- Optional dependencies
      dependencies = { "nvim-tree/nvim-web-devicons" },
   },
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
   },
   {
      "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
   },
}

local opts = {}

-- load plugins
require("lazy").setup(plugins, opts)
