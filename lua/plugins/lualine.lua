return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local custom_theme = require('lualine.themes.auto') -- or your preferred theme

    for _, mode in pairs(custom_theme) do
      for _, section in pairs(mode) do
        section.bg = "NONE"
      end
    end

    return {
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = { fg = custom_theme.normal.a.bg, gui = "bold" },
          }
        },
        lualine_b = { "branch", "diff" },
        lualine_c = {},
        lualine_x = {
          {
            'filename',
            fmt = function(name)
              return (name == '[No Name]' or name == '') and '' or name
            end,
          },
          "filetype",
        },
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end
}
