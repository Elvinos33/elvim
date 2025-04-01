return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_auth_provider_url = "https://schibsted.ghe.com"
    end,
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
        gemini_custom = function()
          return require("codecompanion.adapters").extend("gemini", {
            name = "gemini_custom",
            schema = {
              model = { default = "gemini-2.5-pro-exp-03-25" },
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
          adapter = "gemini_custom",
        },
        inline = {
          adapter = "gemini_custom",
        },
      },
    },
  },
}
