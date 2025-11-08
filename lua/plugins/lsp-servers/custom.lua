-- File for LSP servers that are not in the official lspconfig.nvim repo
return {
  varnishls = {
    default_config = {
      cmd = { "varnishls", "lsp", "--stdio" },
      filetypes = { "vcl", "vtc" },
      root_markers = { ".varnishls.toml", ".git" },
      single_file_support = true,
    },
  },
}
