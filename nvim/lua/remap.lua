local nnoremap = require("keymap").nnoremap
local xnoremap = require("keymap").xnoremap
local inoremap = require("keymap").inoremap
local tnoremap = require("keymap").tnoremap
local wk = require("which-key")
local lsp = vim.lsp
local diagnostic = vim.diagnostic

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
    c = {
      name = "+Conflict",
      o = { "<Plug>(git-conflict-ours)", "Use Ours" },
      t = { "<Plug>(git-conflict-theirs)", "Use Theirs" },
      b = { "<Plug>(git-conflict-both)", "Use Both" },
      N = { "<Plug>(git-conflict-none)", "Use None" },
      p = { "<Plug>(git-conflict-prev-conflict)", "Prev Conflict" },
      n = { "<Plug>(git-conflict-next-conflict)", "Next Conflict" },
    },
    l = {
      name = "+LSP",
      e = { diagnostic.open_float, "Diagnostic" },
      q = { "<cmd>Telescope diagnostics<cr>", "Diagnostic List" },
      f = { lsp.buf.formatting, "Code Formatting" },
      c = { lsp.buf.code_action, "Code Action" },
      R = { lsp.buf.rename, "Rename" },
      r = { lsp.buf.references, "References" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
      D = { lsp.buf.declaration, "Declaration" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "implementation" }
    },
    d = {
      name = "+Delete",
      d = { "<cmd>%bd|e#<cr>", "Delete All Buffers" },
    },
    s = {
      name = "+Set",
      f = { "<cmd>set foldmethod=syntax<cr>", "set foldmethod" },
    },
    b = { "<cmd>Telescope buffers <cr>", "List Buffers" },
    t = { function()
      require("nvterm.terminal").toggle "float"
    end, "Toggle Terminal" },
    j = { "<cmd>HopWordMW<cr>", "Jump Word" },
    L = { "<cmd>HopLineStartMW<cr>", "Jump Line" },
  },
})

nnoremap("<ESC>", "<cmd>noh<CR>")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<TAB>", "<cmd>bnext<cr>")
nnoremap("<S-Tab>", "<cmd>bprevious<cr>")
nnoremap("<C-n>", ":Neotree source=filesystem reveal=true position=left toggle=true<CR>")
nnoremap("[d", diagnostic.goto_prev)
nnoremap("]d", diagnostic.goto_next)
nnoremap("gD", lsp.buf.declaration)
nnoremap("gd", lsp.buf.definition)
nnoremap("K", lsp.buf.hover)
nnoremap("gi", lsp.buf.implementation)
nnoremap("gr", lsp.buf.references)
nnoremap("++", "<Plug>kommentary_line_default")
xnoremap("++", "<Plug>kommentary_visual_default")
inoremap("jk", "<ESC>")
inoremap("kj", "<ESC>")
tnoremap("<ESC>", function()
  require("nvterm.terminal").toggle "float"
end)
