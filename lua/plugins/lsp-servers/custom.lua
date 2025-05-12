-- File for LSP servers that are not in the official lspconfig.nvim repo
return {
  varnishls = {
    default_config = {
      cmd = { "varnishls", "lsp", "--stdio" },
      filetypes = { "vcl", "vtc" },
      root_dir = require("lspconfig").util.root_pattern(".varnishls.toml", ".git"),
      settings = {},
    }
  }
}
