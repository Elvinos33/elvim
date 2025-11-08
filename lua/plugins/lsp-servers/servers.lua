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
            vim.env.VIMRUNTIME .. "/lua",
            vim.fn.stdpath("config") .. "/lua",
            vim.fn.stdpath("data") .. "/lazy/snacks.nvim/lua",
            vim.fn.stdpath("data") .. "/lazy/flash.nvim/lua",
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
    settings = {
      pyright = {
        -- ruff handles this
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
    init_options = {
      settings = {
        logLevel = "info",
        lint = {
          select = { "W", "E", "F", "B", "I" },
          enable = true,
        },
        lineLength = 130,
      },
    },
    on_attach = function(client)
      client.server_capabilities.hoverProvider = false
    end,
  },
  copilot = {
    settings = {
      ["github-enterprise"] = {
        uri = "https://schibsted.ghe.com"
      }
    }
  },
  astro = {},
  biome = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
  clangd = {},
}
