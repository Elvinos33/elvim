require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
  }
})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").lua_ls.setup({})
