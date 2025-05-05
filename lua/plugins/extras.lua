return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { disable_filetype = { "codecompanion", "snacks_input" } },
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
    opts = {},
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      -- live-preview for :%s substitutions
      vim.opt.inccommand = "split"
      -- bigger command-line window
      vim.opt.cmdwinheight = 20
      require("inc_rename").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          -- bottom_search = true, -- use a classic bottom cmdline for search
          -- command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
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
        "<C-ø>",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon previous",
      },
      {
        "<C-æ>",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon next",
      },
    },
  },
}
