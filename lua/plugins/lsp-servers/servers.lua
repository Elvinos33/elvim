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
  -- biome = {
  --   on_attach = function(client, bufnr)
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       buffer = bufnr,
  --       command = "biome"
  --     })
  --   end
  -- },
  bashls = {
    filetypes = { "sh", "bash", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  vtsls = {},
  gopls = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = true,
            maxLineLength = 130,
            -- ignore = { "E501" },
          },
          mccabe = { enabled = false },
          pyflakes = { enabled = false },
          pylint = { enabled = false },
          flake8 = { enabled = false },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          isort = { enabled = false },
          jedi = { enabled = false },
          mypy = { enabled = false },
          pyls_isort = { enabled = false },
        },
      },
    },
  },
  astro = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
