-- lua/plugins/ai.lua
return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      local spinner = require("plugins.extensions.codecompanion-spinner")
      spinner:init()

      vim.keymap.set("x", "<leader>gl", ":<C-u>'<,'>CodeCompanion<CR>", {
        desc = "Inline fix code",
        silent = true,
      })
      vim.keymap.set("x", "<leader>ga", ":<C-u>'<,'>CodeCompanionChat Add<CR>", {
        desc = "Add to Chat",
        silent = true,
      })
      vim.keymap.set("n", "<leader>gt", "<CMD>CodeCompanionChat Toggle<CR>", {
        desc = "Toggle Chat",
      })
      vim.keymap.set("n", "<leader>gd", "<CMD>CodeCompanionActions<CR>", {
        desc = "Open CodeCompanion Actions",
      })
    end,
    opts = (function()
      local adapters = {
        gemini_custom = function()
          return require("codecompanion.adapters").extend("gemini", {
            name = "gemini_custom",
            schema = { model = { default = "gemini-2.5-pro" } },
          })
        end,
        litellm = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://litellm.pct-ai-foundations-pro-1.eks.schibsted.io",
              api_key = os.getenv("LITELLM_PERSONAL_API_KEY"),
            },
            schema = {
              model = {
                default = "gemini/gemini-2.5-pro-preview-05-06",
              },
            },
          })
        end,
      }

      -- define which adapters to use for each strategy
      local default_adapters = {
        chat = "gemini_custom",
        cmd = "gemini",
        inline = "gemini",
      }

      return {
        adapters = adapters,
        display = {
          diff = {
            provider = "mini_diff",
          },
        },
        strategies = {
          chat = {
            adapter = default_adapters.chat,
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
                return " " .. string.upper(string.sub(model_name, 1, 1)) .. string.sub(model_name, 2) -- Capitalize the first letter
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
            adapter = default_adapters.cmd,
          },
          inline = {
            adapter = default_adapters.inline,
          },
        },
      }
    end)(),
  },
}
