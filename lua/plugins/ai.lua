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
    end,
    config = function(_, opts)
      require("codecompanion").setup(opts)

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
      display = {
        diff = { provider = "mini_diff" },
      },
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
      },
      strategies = {
        chat = {
          adapter = "openai_custom",
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
        inline = { adapter = "openai_custom" },
      },
    },
  },
}
