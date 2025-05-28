-- Config for Language Servers (Using mason.nvim, mason-lspconfig.nvim, and nvim-lspconfig)
return {
  "neovim/nvim-lspconfig", -- LSP
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- For installing and managing LSPs
    { "williamboman/mason-lspconfig.nvim" }, -- To use Mason with native LSP
    { "hrsh7th/cmp-nvim-lsp" }, -- For LSP completion
  },
  config = function()
    -- Setup Mason
    require("mason").setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Elvinos33/mason-registry",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "⟳",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp-servers.servers")),
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp-servers.servers")),
      handlers = {
        function(server_name)
          local server_opts = require("plugins.lsp-servers.servers")[server_name] or {}
          server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
          require("lspconfig")[server_name].setup(server_opts)
        end,
      },
    })

    for server, config in pairs(require("plugins.lsp-servers.custom")) do
      require("lspconfig.configs")[server] = config
      require("lspconfig")[server].setup(config)
    end
  end,
}
