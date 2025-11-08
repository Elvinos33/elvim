-- Config for Language Servers (Using mason.nvim, mason-lspconfig.nvim, and nvim-lspconfig)
return {
  "neovim/nvim-lspconfig", -- LSP
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",          config = true }, -- For installing and managing LSPs
    { "williamboman/mason-lspconfig.nvim" },               -- To use Mason with native LSP
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

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Combine all server configurations
    local servers = require("plugins.lsp-servers.servers")
    local custom_servers = require("plugins.lsp-servers.custom")
    local all_servers = vim.tbl_deep_extend("force", servers, custom_servers)

    -- Configure all servers using the new vim.lsp.config API
    for server_name, server_config in pairs(all_servers) do
      -- The 'default_config' key is used for custom servers
      local opts = server_config.default_config or server_config
      opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, opts.capabilities or {})
      vim.lsp.config(server_name, opts)
      vim.lsp.enable(server_name)
    end

    -- mason-lspconfig will see the configurations set by vim.lsp.config
    -- and automatically call vim.lsp.enable() for installed servers.
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(require("plugins.lsp-servers.servers")),
    })
  end,
}
