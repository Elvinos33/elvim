-- File for LSP servers that are not in the official lspconfig.nvim repo
return {
  varnishls = {
    cmd = { "varnishls", "lsp", "--stdio" },
    filetypes = { "vcl", "vtc" },
    root_markers = { ".varnishls.toml", ".git" },
    single_file_support = true,
  }
}
