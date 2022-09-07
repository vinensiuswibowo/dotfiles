require("nvim-treesitter.configs").setup({
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
  },
})
