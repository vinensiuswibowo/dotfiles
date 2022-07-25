local nnoremap = require("keymap").nnoremap
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
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			w = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
			b = { "<cmd>Telescope buffers <CR>", "Buffers" },
		},
		g = {
			name = "+Git",
			a = { "<cmd>Git commit <CR>", "Commit" },
			c = { "<cmd>Telescope git_commits <CR>", "Log" },
			s = { "<cmd>Telescope git_status <CR>", "Status" },
			b = { "<cmd>Telescope git_branches <CR>", "Branches" },
			b = { "<cmd>Git blame <CR>", "Blame" },
		},
		l = {
			name = "+LSP",
			e = { vim.diagnostic.open_float, "Diagnostic" },
			q = { vim.diagnostic.setloclist, "Diagnostic Loc List" },
			f = { vim.lsp.buf.formatting, "Code Formatting" },
			c = { vim.lsp.buf.code_action, "Code Action" },
			r = { vim.lsp.buf.rename, "Rename" },
			d = { vim.lsp.buf.type_definition, "Type Definition" },
		},
		t = {
			name = "+Trouble",
			t = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
			f = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
		},
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
