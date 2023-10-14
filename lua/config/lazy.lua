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
   'ThePrimeagen/harpoon',
   'ellisonleao/gruvbox.nvim',
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
   },
   {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      dependencies = { {'nvim-lua/plenary.nvim'} },
   },
}

local opts = {}

-- load plugins
require("lazy").setup(plugins, opts)
