vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.lua" },
  callback = function()
    vim.opt.shiftwidth = 3
    vim.opt.tabstop = 3
    vim.softtabstop = 3
  end
})
