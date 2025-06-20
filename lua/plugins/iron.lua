return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          python = {
            -- Get the current working directory
            command = function()
              return { "ipython", "--no-autoindent", "--colors=Linux" }
            end,
            -- command = function()
            --   return { "python" }
            -- end,
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
        },
        -- Set the file type of the newly created repl to ft
        repl_filetype = function(bufnr, ft)
          return ft
        end,
        -- How the repl window will be displayed
        repl_open_cmd = view.right(60),
      },
      -- Iron doesn't set keymaps by default anymore.
      keymaps = {
        toggle_repl = "<space>rr",
        restart_repl = "<space>rR",
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_paragraph = "<space>sp",
        send_until_cursor = "<space>su",
        send_mark = "<space>sm",
        send_code_block = "<space>sb",
        send_code_block_and_move = "<space>sn",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })

    -- Additional keymaps
  end,
  -- Optional: if you want the plugin to be loaded only for specific file types
  -- ft = {"python", "sh"},
  -- Optional: if you want to lazy-load but ensure it's available when needed
  keys = {
    { "<space>rr", desc = "Toggle REPL" },
    { "<space>rf", desc = "Focus REPL" },
    -- { "<space>rh", desc = "Hide REPL" },
    -- Add other keymaps as needed
  },
}
