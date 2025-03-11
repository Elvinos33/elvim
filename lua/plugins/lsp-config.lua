-- Config for Language Servers (Using mason.nvim, mason-lspconfig.nvim, and nvim-lspconfig)
return {
  "neovim/nvim-lspconfig", -- LSP
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", config = true }, -- For installing and managing LSPs
    { "williamboman/mason-lspconfig.nvim" }, -- To use Mason with native LSP
    { "hrsh7th/cmp-nvim-lsp" }, -- For LSP completion
    { "j-hui/fidget.nvim" }, -- For LSP status updates
  },
  config = function()
    -- Setup Mason
    require("mason").setup({
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

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })
    require("mason-lspconfig").setup_handlers({
      function(server)
        local server_opts = require("plugins.lsp-servers.servers")[server] or {}
        server_opts.capabilities = capabilities

        require("lspconfig")[server].setup(server_opts)
      end,
    })
  end,
}
