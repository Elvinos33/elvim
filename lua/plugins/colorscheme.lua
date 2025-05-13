-- Config for colorscheme

return {
  -- {
  --   "Lokaltog/vim-distinguished",
  --   lazy = false, -- Load the colorscheme at startup
  --   priority = 1000, -- Make sure it loads early (like your catppuccin setup)
  --   config = function()
  --     -- Set the colorscheme after the plugin has been loaded
  --     vim.cmd.colorscheme("distinguished")
  --
  --     -- Optional: You might want to customize highlight groups here if needed.
  --     -- The settings below were for Catppuccin and might not look right
  --     -- or be necessary with vim-distinguished. Test without them first.
  --     -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
  --     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  --   end,
  -- },
  {
    "sainnhe/gruvbox-material",
    version = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    config = function(_, opts)
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end,
  },
}
