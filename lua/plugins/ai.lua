-- lua/plugins/ai.lua
return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_auth_provider_url = "https://schibsted.ghe.com"
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
      vim.api.nvim_set_keymap("i", "<C-q>", 'copilot#Accept("<CR>")', {
        silent = true,
        expr = true,
      })
    end,
  },
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
    opts = {
      adapters = {
        copilot_custom = function()
          return require("codecompanion.adapters").extend("copilot", {
            name = "copilot_custom",
            schema = { model = { default = "claude-3.7-sonnet" } },
          })
        end,
        gemini_custom = function()
          return require("codecompanion.adapters").extend("gemini", {
            name = "gemini_custom",
            schema = { model = { default = "gemini-2.5-pro-exp-03-25" } },
          })
        end,
        openai_custom = function()
          return require("codecompanion.adapters").extend("openai", {
            name = "openai_custom",
            schema = { model = { default = "o4-mini" } },
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
                default = "gemini/gemini-2.0-flash",
              },
            },
          })
        end,
      },
      display = {
        diff = {
          provider = "mini_diff",
        },
      },
      strategies = {
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
              string.upper(string.sub(model_name, 1, 1)) .. string.sub(model_name, 2) -- Capitalize the first letter
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
          adapter = "litellm",
        },
        inline = { adapter = "litellm" },
      },
    },
  },
}
