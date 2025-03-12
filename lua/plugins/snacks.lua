return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    lazygit = { enabled = true },
    git = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    gitbrowse = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    image = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 75, total = 150 },
      },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end },
    { "<leader>space", function() Snacks.picker.smart() end},
    { "<leader>fg", function() Snacks.picker.grep() end },
    { "<leader>fb", function() Snacks.picker.buffers() end },
    { "<leader>gg", function() Snacks.lazygit() end },
    { "<leader>go", function() Snacks.gitbrowse() end },
    { "<leader>gb", function() Snacks.git.blame_line() end },
  }
}
