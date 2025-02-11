return {
  {
    "github/copilot.vim",
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
          provider = "mini_diff"
        }
      },
      strategies = {
        chat = {
          adapter = "copilot"
        },
      }
    }
  }
}
