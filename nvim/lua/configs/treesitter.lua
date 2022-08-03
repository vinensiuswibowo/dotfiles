
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "typescript",
    "css",
    "html",
    "javascript",
    "typescript",
    "go",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
})
