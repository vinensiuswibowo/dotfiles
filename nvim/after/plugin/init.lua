local cmd = vim.cmd
local g = vim.g

g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
g.tokyonight_italic_functions = true

require("tokyonight").setup({
  style = "moon",
  light_style = "night",
  transparent = false,
  terminal_colors = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end,
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})

cmd([[colorscheme tokyonight-night]])

require("config.lsp")
require("config.gitsign")
require("config.treesitter")
require("config.whichkey")
require("config.telescope")
require("config.neotree")
require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })
require("nvim-autopairs").setup({
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
})
require("config.vimEnter")
require("config.terminal")
require('spectre').setup()

cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
