-- Config for automatic formatting

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      svelte = { "prettier" },
      astro = { "prettier" },
      tsx = { "prettier" },
      jsx = { "prettier" },
      vue = { "prettier" }
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  }
}
