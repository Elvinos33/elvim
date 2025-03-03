return {
  {
    "github/copilot.vim",
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      display = {
        diff = {
          provider = "mini_diff",
        },
      },
      adapters = {
        -- Define a custom Copilot adapter
        copilot_custom = function()
          return require("codecompanion.adapters").extend("copilot", {
            name = "copilot_custom",
            schema = {
              model = { default = "claude-3.7-sonnet" },
            },
          })
        end,
        openai_custom = function()
          return require("codecompanion.adapters").extend("copilot", {
            name = "openai_custom",
            schema = {
              model = { default = "o3-mini-2025-01-31" },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot_custom",
        },
      },
    },
  },
}
