local api = vim.api;

local function ts_disable(_, bufnr)
  return api.nvim_buf_line_count(bufnr) > 5000
end

local M = {
  ensure_installed = {
    "lua",
    "typescript",
    "css",
    "html",
    "javascript",
    "typescript",
    "go",
    "vim",
    "json",
    "scss",
    "http"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = function(lang, bufnr)
      return lang == "cmake" or ts_disable(lang, bufnr)
    end,
    additional_vim_regex_highlighting = { "latex" },
  },
}

return M
