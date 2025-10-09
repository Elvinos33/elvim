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
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    opts = {}
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
      vim.keymap.set("n", "<leader>gh", "<CMD>CodeCompanionChat Toggle<CR>", {
        desc = "Toggle Chat",
      })
      vim.keymap.set("n", "<leader>gd", "<CMD>CodeCompanionActions<CR>", {
        desc = "Open CodeCompanion Actions",
      })
    end,
    opts = {
      adapters = {
        http = {
          copilot_custom = function()
            return require("codecompanion.adapters").extend("copilot", {
              name = "copilot_custom",
              schema = { model = { default = "claude-4-sonnet" } },
            })
          end,
          gemini_custom = function()
            return require("codecompanion.adapters").extend("gemini", {
              name = "gemini_custom",
              schema = { model = { default = "gemini-2.5-pro" } },
            })
          end,
          openai_custom = function()
            return require("codecompanion.adapters").extend("openai", {
              name = "openai_custom",
              schema = { model = { default = "gpt-5" } },
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
      },
      display = {
        diff = {
          provider = "mini_diff",
        },
      },
      strategies = {
        chat = {
          adapter = "litellm",
          agents = {
            {
              name = "litellm",
              adapter = "litellm",
              schema = {
                model = { default = "claude-4-sonnet" },
              },
            },
          },
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
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            -- MCP Tools
            make_tools = true,                    -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
            show_server_tools_in_chat = true,     -- Show individual tools in chat completion (when make_tools=true)
            add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
            show_result_in_chat = true,           -- Show tool results directly in chat buffer
            format_tool = nil,                    -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
            -- MCP Resources
            make_vars = true,                     -- Convert MCP resources to #variables for prompts
            -- MCP Prompts
            make_slash_commands = true,           -- Add MCP prompts as /slash commands
          }
        }
      }

    },
  }
}
