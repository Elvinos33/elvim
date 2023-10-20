require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    'lua_ls',
    'rust_analyzer',
    'html',
    'pyright',
    'tailwindcss',
    'volar',
    'svelte',
    'tsserver',
  }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()


require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
})

require("lspconfig").pyright.setup({
   capabilities = capabilities,
})

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' }}
    }
  }
})

require("lspconfig").html.setup({
  capabilities = capabilities,
})

require("lspconfig").tailwindcss.setup({
   capabilities = capabilities,
})

require("lspconfig").volar.setup({
   capabilities = capabilities,
})

require("lspconfig").svelte.setup({
   capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
   capabilities = capabilities,
})
