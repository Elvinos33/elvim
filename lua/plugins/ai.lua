return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_auth_provider_url = "https://schibsted.ghe.com"
    end
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        litellm = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://litellm.pct-ai-foundations-pro-1.eks.schibsted.io",
              api_key = os.getenv("LITELLM_API_KEY"),
            },
            schema = {
              model = {
                default = "gemini/gemini-2.0-flash"
              }
            }
          })
        end
      },
      display = {
        diff = {
          provider = "mini_diff"
        }
      },
      strategies = {
        inline = {
          adapter = "litellm"
        },
        chat = {
          adapter = "litellm"
        },
        cmd = {
          adapter = "litellm"
        }
      }
    }
  }
}
