-- Config for colorscheme

return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      vim.opt.termguicolors = true
      vim.g.gruvbox_material_background = "medium"      -- hard|medium|soft
      vim.g.gruvbox_material_transparent_background = 1 -- 1 = transparent
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
    end,
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    end,
  },

}
