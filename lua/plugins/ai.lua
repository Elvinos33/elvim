return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      auth_provider_url = "https://schibsted.ghe.com",
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-q>"
        }
      }
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      {
        "Davidyz/VectorCode",
        version = "*",
        build = "uv tool upgrade vectorcode",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    opts = function()
      return {
        adapters = {
          litellm = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://litellm.pct-ai-foundations-pro-1.eks.schibsted.io",
                api_key = os.getenv("LITELLM_PERSONAL_API_KEY"),
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
            adapter = "litellm",
            roles = {
              llm = function(adapter)
                local model_name = ""
                if adapter.schema and adapter.schema.model and adapter.schema.model.default then
                  local model = adapter.schema.model.default
                  if type(model) == "function" then
                    model = model(adapter)
                  end
                  model_name = model
                  model_name = string.match(model_name, "/(.*)") or model_name
                end
                return " " ..
                    string.upper(string.sub(model_name, 1, 1)) ..
                    string.sub(model_name, 2) -- Capitalize the first letter
              end,
              user = " User",
            },
            keymaps = {
              send = {
                callback = function(chat)
                  vim.cmd("stopinsert")
                  chat:submit()
                  chat:add_buf_message({ role = "llm", content = "" })
                end,
                index = 1,
                description = "Send",
              },
            },
          },
          cmd = {
            adapter = "litellm"
          }
        },
        extensions = {
          vectorcode = {
            opts = { add_tool = true, add_slash_command = true, tool_opts = { auto_submit = { ls = false, query = false }, no_duplicate = true, } },
          },
        }
      }
    end,
    init = function()
      local spinner = require("plugins.extensions.codecompanion-spinner")
      spinner:init()
    end,
  }
}
