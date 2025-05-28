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
          extra_args = {
            "--apply",
            "--formatter-format-with-errors",
          },
          require_cwd = false,
          cwd = require("conform.util").root_file({ "biome.json" }),
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
        rust = { "rustfmt" },
        javascript = { "biome", "prettier" },
        javascriptreact = { "biome", "prettier" },
        typescript = { "biome", "prettier" },
        typescriptreact = { "biome", "prettier" },
        svelte = { "biome", "prettier" },
        astro = { "biome", "prettier" },
        tsx = { "biome", "prettier" },
        jsx = { "biome", "prettier" },
        vue = { "biome", "prettier" },
        html = { "biome", "prettier" },
        sql = { "sleek" },
        json = { "biome", "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
