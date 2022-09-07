require("which-key").setup({
  icons = {
    breadcrumb = "»",
    separator = "  ",
    group = "+ ",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "none",
  },
  layout = {
    spacing = 6,
  },
  operators = {
    gc = "Comments",
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", "v:" },
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
})
