-- Config for autocomplete and snippets using nvim-cmp and LuaSnip

return {
  "hrsh7th/nvim-cmp", -- Autocomplete
  event = "InsertEnter",
  dependencies = {
    -- LSP Completion
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",

    -- Snippets
    "L3MON4D3/LuaSnip",             -- Plugin for snippets
    "saadparwaiz1/cmp_luasnip",     -- Use snippets with LSP
    "rafamadriz/friendly-snippets", -- Extra nice to have snippets
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-Tab>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'treesitter' },
      })
    })
  end
}
