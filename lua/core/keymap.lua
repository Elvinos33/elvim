-- Base Bindings
------------------------------------------------------------------

--- Escape
vim.keymap.set("i", "jk", "<ESC>", { desc = "exit insert mode with jk", noremap = true })

--- Remove highligts
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })

------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", function()
  if require("trouble").is_open() then
    require("trouble").next({ skip_groups = true, jump = true })
  else
    vim.diagnostic.jump({ count = 1, float = true })
  end
end, { desc = "Go to next diagnostic" })

vim.keymap.set("n", "gE", function()
  if require("trouble").is_open() then
    require("trouble").prev({ skip_groups = true, jump = true })
  else
    vim.diagnostic.jump({ count = -1, float = true })
  end
end, { desc = "Go to prev diagnostic" })
------------------------------------------------------------------

-- Vault convert json to env
vim.keymap.set(
  "n",
  "<leader>vf",
  [[:%!jq -r 'to_entries | .[] | "\(.key)=\(.value|tojson)"'<CR>]],
  { desc = "Convert a vault json object to .env" }
)
-- Copy file structure of wdir in normal mode
vim.keymap.set(
  "n",
  "L",
  function()
    -- Exclude common directories such as node_modules, .git, .venv, etc.
    local exclude = { "node_modules", ".git", ".venv", ".cache", "dist", "build" }
    local find_cmd = { "find", ".", "-type", "f" }
    for _, dir in ipairs(exclude) do
      table.insert(find_cmd, "!")
      table.insert(find_cmd, "-path")
      table.insert(find_cmd, "./" .. dir .. "/*")
    end
    local result = vim.fn.system(find_cmd)
    vim.fn.setreg("+", result)
  end,
  { noremap = true, silent = true, desc = "Copy file paths recursively to system clipboard, excluding common paths" }
)
