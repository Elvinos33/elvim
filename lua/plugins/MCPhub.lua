return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>mc", "<cmd>MCPHub<cr>", desc = "Open MCPHub" },
  },
  build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  config = function()
    require("mcphub").setup()
  end,
}
