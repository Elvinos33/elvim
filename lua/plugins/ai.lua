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
    end,
    keys = {
      {
        "<leader>gl",
        ":<C-u>'<,'>CodeCompanion<CR>",
        mode = "x",
        desc = "Inline fix code",
        silent = true,
      },
      {
        "<leader>ga",
        ":<C-u>'<,'>CodeCompanionChat Add<CR>",
        mode = "x",
        desc = "Add to Chat",
        silent = true,
      },
      {
        "<leader>gt",
        "<CMD>CodeCompanionChat Toggle<CR>",
        mode = "n",
        desc = "Toggle Chat",
      },
      {
        "<leader>gc",
        "<CMD>CodeCompanionActions<CR>",
        mode = "n",
        desc = "Open CodeCompanion Actions",
      },
    },
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
                default = "bedrock-claude4-sonnet",
              },
            },
          })
        end,
      }

      -- define which adapters to use for each strategy
      local default_adapters = {
        chat = "litellm",
        cmd = "litellm",
        inline = "litellm",
      }

      return {
        adapters = adapters,
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              -- MCP Tools
              make_tools = true, -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
              show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
              add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
              show_result_in_chat = true, -- Show tool results directly in chat buffer
              format_tool = nil, -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
              -- MCP Resources
              make_vars = true, -- Convert MCP resources to #variables for prompts
              -- MCP Prompts
              make_slash_commands = true, -- Add MCP prompts as /slash commands
            },
          },
        },
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
              user = " Haarr",
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
