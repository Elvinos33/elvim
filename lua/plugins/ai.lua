-- lua/plugins/ai.lua
return {
  {
    "folke/sidekick.nvim",
    init = function()
      -- Enable Neovim's native inline completions (v0.12+)
      -- This provides ghost text suggestions WHILE typing
      vim.lsp.inline_completion.enable()
    end,
    opts = {
      nes = {
        enabled = false, -- Disabled: colors don't match theme well
      },
      cli = {
        tools = {
          claude = {
            cmd = { vim.fn.expand("~/.claude/local/claude") },
          },
        },
      },
      debug = true, -- Enable debug logging for troubleshooting
    },
    keys = {
      {
        "<C-q>",
        function()
          -- Accept inline completion from Copilot
          if vim.lsp.inline_completion.get() then
            return -- inline completion handled
          end
        end,
        expr = true,
        desc = "Accept Inline Completion",
        mode = { "i" },
      },
      {
        "<c-.>",
        function() require("sidekick.cli").focus() end,
        desc = "Sidekick Switch Focus",
        mode = { "n", "x", "i", "t" },
      },
      {
        "<leader>aa",
        function() require("sidekick.cli").toggle({ focus = true }) end,
        desc = "Sidekick Toggle CLI",
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function() require("sidekick.cli").prompt() end,
        mode = { "n", "v" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<leader>ac",
        function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
        desc = "Sidekick Toggle Claude",
        mode = { "n", "v" },
      },
    },
  }
}
