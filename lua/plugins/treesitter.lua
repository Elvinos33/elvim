-- Config for treesitter

return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,
      ensure_installed = {
        "typescript",
        "go",
        "rust",
        "lua",
        "vim",
        "vimdoc",
        "astro",
        "tsx",
        "terraform",
        "svelte",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },

    })
  end
}
