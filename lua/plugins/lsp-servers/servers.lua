-- plugins/lsp-servers/servers.lua
return {
  terraformls = {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "tf", "hcl", "terraform-vars" },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
          telemetry = { enable = false },
          library = {
            "${3rd}/love2d/library",
          },
        },
        diagnostics = { globals = { "vim" } },
      },
    },
  },
  eslint = {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
    end,
  },
  bashls = {
    filetypes = { "sh", "bash", "zsh", "envrc" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  vtsls = {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  },
  gopls = {},
  --  Pyright for LSP features (Go to Definition, Hover, etc.)
  pyright = {
    -- https://github.com/microsoft/pyright/discussions/5852#discussioncomment-6874502
    -- capabilities = {
    --   textDocument = {
    --     publishDiagnostics = {
    --       tagSupport = {
    --         valueSet = { 2 },
    --       },
    --     },
    --   },
    -- },
    settings = {
      pyright = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- ignore = { "*" },
          typeCheckingMode = "off",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  ruff = {
    settings = {
      -- logLevel = "info",
      -- logFile = "~/.local/state/nvim/ruff-lsp.log",
      lint = {
        select = { "E", "F", "B", "I" },
      },
      format = {
        lineLength = 130,
      },
    },
    on_attach = function(client)
      client.server_capabilities.hoverProvider = false
    end,
  },
  astro = {},
  biome = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
