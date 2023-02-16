local wk = require("which-key")
local lsp = vim.lsp
local diagnostic = vim.diagnostic


local function bind(op, outer_opts)
  outer_opts = outer_opts or { noremap = true }
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force", outer_opts, opts or {})
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

local nnoremap = bind("n")
local inoremap = bind("i")
local xnoremap = bind("x")
local tnoremap = bind("t")

wk.register({
    ["<leader>"] = {
        q = { "<cmd>BufferClose<cr>", "Close Buffer" },
        n = { "<cmd>Neotree source=filesystem reveal=true toggle=true<CR>", "Toggle File Tree" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        F = { "<cmd>lua require('spectre').open() <cr>", "Find and Replace" },
        w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        g = {
            name = "+Git",
            c = { "<cmd>Git commit <CR>", "Commit" },
            l = { "<cmd>Telescope git_commits <CR>", "Log" },
            s = { "<cmd>Telescope git_status <CR>", "Status" },
            b = { "<cmd>Telescope git_branches <CR>", "Branches" },
            B = { "<cmd>Git blame <CR>", "Blame" },
            o = { "<Plug>(git-conflict-ours)", "Use Ours" },
            t = { "<Plug>(git-conflict-theirs)", "Use Theirs" },
            h = { "<Plug>(git-conflict-both)", "Use Both" },
            p = { "<Plug>(git-conflict-prev-conflict)", "Prev Conflict" },
            n = { "<Plug>(git-conflict-next-conflict)", "Next Conflict" },
        },
        c = { lsp.buf.code_action, "LSP Code Action" },
        l = {
            name = "+LSP",
            e = { diagnostic.open_float, "Diagnostic" },
            q = { require('telescope.builtin').diagnostics, "Diagnostic List" },
            f = { lsp.buf.format, "Code Formatting" },
            R = { lsp.buf.rename, "Rename" },
            r = { require('telescope.builtin').lsp_references, "References" },
            d = { require('telescope.builtin').lsp_type_definitions, "Type Definition" },
            D = { require('telescope.builtin').lsp_definitions, "Definition" },
            i = { require('telescope.builtin').lsp_implementations, "implementation" },
            s = { require('telescope.builtin').lsp_document_symbols, "Symbols" }
        },
        r = {
            name = "+ Rest Request",
            r = { "<Plug>RestNvim<cr>", "Send Request" }
        },
        d = {
            name = "+Delete",
            d = { "<cmd>%bd|e#<cr>", "Delete All Buffers" },
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
nnoremap("<TAB>", "<cmd>BufferNext<cr>")
nnoremap("<S-Tab>", "<cmd>BufferPrevious<cr>")
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
nnoremap('zR', require('ufo').openAllFolds)
nnoremap('zM', require('ufo').closeAllFolds)
