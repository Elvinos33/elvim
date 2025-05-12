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
  vtsls = {},
  gopls = {},
  pyright = {},
  astro = {},
  svelte = {},
  emmet_ls = {},
  html = {},
  tailwindcss = {},
}
