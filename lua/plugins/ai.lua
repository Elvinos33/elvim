-- lua/plugins/ai.lua
return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_auth_provider_url = "https://schibsted.ghe.com"
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, opts)
      require("codecompanion").setup(opts)

      -- Keymaps moved from keymap.lua
      vim.keymap.set("x", "<leader>gl", ":<C-u>'<,'>CodeCompanion<CR>", { desc = "Inline fix code" })
      vim.keymap.set({ "x" }, "<leader>ga", ":<C-u>'<,'>CodeCompanionChat Add<CR>", { desc = "Add to Chat" })
      vim.keymap.set({ "n" }, "<leader>gt", "<CMD>CodeCompanionChat Toggle<CR>", { desc = "Toogle Chat" })
      vim.keymap.set("n", "<leader>gd", "<CMD>CodeCompanionActions<CR>", { desc = "Open Codecompanion Actions" })
    end,
    opts = {
      display = {
        diff = {
          provider = "mini_diff",
        },
      },
      adapters = {
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
          return require("codecompanion.adapters").extend("openai", {
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
