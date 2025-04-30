return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "codecompanion", "snacks_input" },
    },
  },
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      debounce = 10,
      render_modes = true,
      sign = {
        enabled = false,
      },
    },
  },
  {
    "echasnovski/mini.diff",
    opts = {}
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
  {
    "echasnovski/mini.ai",
    version = '*',
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function()
      local miniai = require('mini.ai')
      return {
        n_lines = 500,
        custom_textobjects = {
          F = miniai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
        },
      }
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
}
