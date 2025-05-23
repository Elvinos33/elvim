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
          require_cwd = false,
          cwd = require("conform.util").root_file({
            "biome.json",
          }),
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        rust = { "rustfmt" },
        javascript = { "prettier", "biome" },
        typescript = { "prettier", "biome" },
        svelte = { "prettier", "biome" },
        astro = { "prettier", "biome" },
        tsx = { "prettier", "biome" },
        jsx = { "prettier", "biome" },
        vue = { "prettier", "biome" },
        html = { "prettier", "biome" },
        sql = { "sleek" },
        json = { "prettier", "biome" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
