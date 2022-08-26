local nnoremap = require("keymap").nnoremap
local xnoremap = require("keymap").xnoremap
local inoremap = require("keymap").inoremap
local tnoremap = require("keymap").tnoremap
-- local vnoremap = require("keymap").vnoremap
local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    q = { "<cmd>bdelete<cr>", "Close Buffer" },
    f = {
      name = "+Find",
      n = { "<cmd>enew<cr>", "New File" },
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      a = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find All File" },
      o = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      b = { "<cmd>Telescope buffers <CR>", "Buffers" },
      k = { "<cmd>Telescope keymaps <CR>", "Keymaps" },
      r = { "<cmd>lua require('spectre').open() <cr>", "Find and Replace" }
    },
    g = {
      name = "+Git",
      c = { "<cmd>Git commit <CR>", "Commit" },
      l = { "<cmd>Telescope git_commits <CR>", "Log" },
      s = { "<cmd>Telescope git_status <CR>", "Status" },
      b = { "<cmd>Telescope git_branches <CR>", "Branches" },
      B = { "<cmd>Git blame <CR>", "Blame" },
    },
    l = {
      name = "+LSP",
      e = { vim.diagnostic.open_float, "Diagnostic" },
      q = { vim.diagnostic.setloclist, "Diagnostic Loc List" },
      f = { vim.lsp.buf.formatting, "Code Formatting" },
      c = { vim.lsp.buf.code_action, "Code Action" },
      R = { vim.lsp.buf.rename, "Rename" },
      r = { vim.lsp.buf.references, "References" },
      t = { vim.lsp.buf.type_definition, "Type Definition" },
      d = { vim.lsp.buf.definition, "Definition" },
      D = { vim.lsp.buf.declaration, "Declaration" },
      i = { vim.lsp.buf.implementation, "implementation" }
    },
    t = { function()
      require("nvterm.terminal").toggle "float"
    end, "Toggle Terminal" },
    j = { "<cmd>HopWordMW<cr>", "Jump Word" },
    L = { "<cmd>HopLineStartMW<cr>", "Jump Line" },
  },
})

nnoremap("<ESC>", "<cmd> noh <CR>")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<TAB>", "<cmd>bnext<cr>")
nnoremap("<S-Tab>", "<cmd>bprevious<cr>")
nnoremap("<C-n>", ":Neotree source=filesystem reveal=true position=float toggle=true<CR>")
nnoremap("[d", vim.diagnostic.goto_prev)
nnoremap("]d", vim.diagnostic.goto_next)
nnoremap("gD", vim.lsp.buf.declaration)
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("K", vim.lsp.buf.hover)
nnoremap("gi", vim.lsp.buf.implementation)
nnoremap("gr", vim.lsp.buf.references)
nnoremap("++", "<Plug>kommentary_line_default")
xnoremap("++", "<Plug>kommentary_visual_default")

inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")

tnoremap("<ESC>", function()
  require("nvterm.terminal").toggle "float"
end)
