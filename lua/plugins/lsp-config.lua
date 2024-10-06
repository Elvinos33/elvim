--Config for Language Servers (Using mason.nvim, mason-lspconfig.nvim, and nvim-lspconfig)

return {
  "neovim/nvim-lspconfig", -- LSP
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",          config = true }, -- For installing and managing LSPs
    { "williamboman/mason-lspconfig.nvim" },               -- To use Mason with native LSP
    { "hrsh7th/cmp-nvim-lsp" },
    { "j-hui/fidget.nvim" },
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "⟳",
          package_uninstalled = "✗",
        }
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp-servers.servers"))
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup_handlers({
      function(server)
        require("lspconfig")[server].setup({
          capabilities = capabilities,
          settings = require("plugins.lsp-servers.servers")[server],
          filetypes = (require("plugins.lsp-servers.servers")[server] or {}).filetypes,
        })
      end
    })
  end
}
