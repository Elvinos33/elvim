-- Config for completion using blink.cmp

return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "*",
  opts = {
    keymap = {
      preset = "none",
      ["<C-space>"] = { "show", "hide_documentation" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<C-q>"] = {
        function()         -- Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      list = {
        selection = { preselect = true, auto_insert = true }
      },
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        border = "rounded",
        winblend = 0,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
          winblend = 0,
          winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    snippets = {
      preset = "default"
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
        winblend = 0,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
      }
    }
  },
}
