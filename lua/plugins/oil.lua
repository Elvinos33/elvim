return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == ".." or name == ".git"
      end
    },
  }
}
