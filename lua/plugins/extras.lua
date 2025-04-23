return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "echasnovski/mini.diff",
    opts = {},
  },
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require("dropbar.api")
      vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      vim.keymap.set("n", "<leader>æ", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      vim.keymap.set("n", "<leader>ø", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({})
    end,
  },
  {
    "echasnovski/mini.ai",
    version = "*",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function()
      local miniai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          F = miniai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup({})
    end,
    keys = {
      {
        "<leader>a",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon add file",
      },
      {
        "<C-e>",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon toggle UI",
      },
      {
        "<C-p>", -- Note: <C-S-P> might not work on all terminals/GUIs. Consider alternative binds.
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon previous",
      },
      {
        "<C-å>", -- Note: <C-S-N> might not work on all terminals/GUIs. Consider alternative binds.
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon next",
      },
    },
  },
}
