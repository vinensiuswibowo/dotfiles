local vim = vim

local M = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.1,
        col = 0.2,
        width = 0.6,
        height = 0.6,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .2, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = false,
  },
}
return M
