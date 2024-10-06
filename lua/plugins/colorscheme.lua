-- Config for different colorschemes, current colorscheme is set in core/lazy.lua

return {
  {
    "sainnhe/gruvbox-material",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    end,
  },
}
