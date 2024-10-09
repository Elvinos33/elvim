return {
  {
    "ibhagwan/fzf-lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    opts = {},
  },
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        enabled = true,
      }
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
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
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit"
    },
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {}
  },
  {
    'echasnovski/mini.ai',
    version = '*',
    opts = {}
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      vim.api.nvim_set_hl(0, 'FlashLabel', { foreground = '#282828', background = '#D4BE98' })
    end
  },
}
