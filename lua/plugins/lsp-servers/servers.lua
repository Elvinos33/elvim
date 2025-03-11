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
  biome = {
    on_attach = function(bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "biome",
      })
    end,
  },
  bashls = {
    filetypes = { "sh", "bash", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  vtsls = {},
  gopls = {},
  --  Pyright for LSP features (Go to Definition, Hover, etc.)
  pyright = {
    settings = {
      pyright = {
        disableOrganizeImports = true, --  Ruff handles import organization
      },
      python = {
        analysis = {
          -- ignore = { "*" }, --  Ignore all files for analysis (Ruff handles linting)
        },
      },
    },
  },
  --  Ruff LSP for linting, formatting, and import sorting
  ruff = {
    init_options = {
      settings = {
        lineLength = 130, -- Set max line length
        logLevel = "debug", --  Enable Ruff logging
        logFile = "~/.local/state/nvim/ruff-lsp.log", --  Log Ruff output
      },
    },
  },
  astro = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
