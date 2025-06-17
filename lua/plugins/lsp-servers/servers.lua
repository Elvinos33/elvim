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
        diagnostics = { globals = { 'vim' } },
      },
    },
  },
  eslint = {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll"
      })
    end
  },
  bashls = {
    filetypes = { "sh", "bash", "zsh", "envrc" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  vtsls = {
    root_dir = function()
      require("lspconfig").util.root_pattern("package.json")
    end
  },
  denols = {
    root_dir = function()
      require("lspconfig").util.root_pattern("import_map.json", "deno.json")
    end
  },
  gopls = {},
  pyright = {},
  astro = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
