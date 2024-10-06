return {
  terraformls = {
    cmd = { "terraform-ls" },
    arg = { "server" },
    filetypes = { "terraform", "tf", "terraform-vars" },
  },
  lua_ls = {
    Lua = {
      diagnostics = { globals = { 'vim' } }
    }
  },
  bashls = {
    filetypes = { "sh", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  vtsls = {},
  gopls = {},
  pyright = {},
  astro = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
