local cmd = vim.cmd

cmd([[colorscheme tokyonight-night]])
cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]])
require("config.statusline")
local servers = {
  "tsserver",
  "cssls",
  "gopls",
  "html",
  "sumneko_lua",
  "angularls",
  "jsonls"
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities
  }
end
