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
    gitbrowse = {
      notify = true,
      remote_patterns = {
        { "^schibsted@schibsted%.ghe%.com:(.+)%.git$", "https://schibsted.ghe.com/%1" },
        { "^schibsted@schibsted%.ghe%.com:(.+)$",      "https://schibsted.ghe.com/%1" },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,   -- Show hidden files
          ignored = false, -- Don't show gitignored files (respect gitignore)
        },
        smart = {
          -- If you want smart picker to also include hidden files
          multi = { "buffers", "recent", "files" },
          -- The files source will inherit the hidden=true setting from above
        },
      },
    },
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
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
    },
    {
      "<leader>fs",
      function()
        Snacks.picker.smart()
      end,
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.grep()
      end,
    },
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
    },
    {
      "<leader>go",
      function()
        Snacks.gitbrowse()
      end,
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
    },
  },
}
