-- Config for colorscheme

return {
  {
    "catppuccin/nvim",
    version = false,
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end,
  },
}
