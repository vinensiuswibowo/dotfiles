local api = vim.api

api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  nested = true,
  callback = function()
    local buf_is_valid = api.nvim_buf_is_valid
    local buf_get_name = api.nvim_buf_get_name
    local name = buf_is_valid(1) and buf_get_name(1) or nil
    if name == '' or not name then
      require('telescope.builtin').find_files()
    end
  end,
})
