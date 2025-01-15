return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        prettier = {
          require_cwd = true,
          cwd = require("conform.util").root_file({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
          }),
        },
        biome = {
          require_cwd = true,
          cwd = require("conform.util").root_file({
            "biome.json",
          }),
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt" },
        javascript = { "prettier", "biome" },
        typescript = { "prettier", "biome" },
        svelte = { "prettier", "biome" },
        astro = { "prettier", "biome" },
        tsx = { "prettier", "biome" },
        jsx = { "prettier", "biome" },
        vue = { "prettier", "biome" },
        html = { "prettier", "biome" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
