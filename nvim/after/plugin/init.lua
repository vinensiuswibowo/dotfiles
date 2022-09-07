cmd = vim.cmd

cmd([[colorscheme tokyonight]])
cmd([[autocmd FileType alpha setlocal nofoldenable]])
cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])

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
require("bufferline").setup()
require("config.terminal")
require('spectre').setup()
