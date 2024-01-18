require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "go", "rust", "lua", "vim", "vimdoc", "astro", "tsx" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
