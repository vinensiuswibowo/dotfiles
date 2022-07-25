require("nvim-lsp-installer").setup({
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = " ",
			server_pending = " ",
			server_uninstalled = " ﮊ",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	max_concurrent_installers = 10,
})

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = { "tsserver", "cssls", "gopls", "html", "sumneko_lua" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	})
end

local function lsp_info()
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			if client.attached_buffers[vim.api.nvim_get_current_buf()] then
				return (vim.o.columns > 100 and "%#St_LspStatus#" .. "   LSP ~ " .. client.name .. " ")
					or "   LSP "
			end
		end
	end
end

local function git_info()
	if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
		return ""
	end

	local git_status = vim.b.gitsigns_status_dict
	local added = (git_status.added and git_status.added ~= 0) and (" + " .. git_status.added) or ""
	local changed = (git_status.changed and git_status.changed ~= 0) and (" ~ " .. git_status.changed) or ""
	local removed = (git_status.removed and git_status.removed ~= 0) and (" - " .. git_status.removed) or ""
	local branch_name = "   " .. git_status.head .. " "

	return added .. changed .. removed
end

local function file_path()
	local filepath = vim.fn.expand("%:r")
	local ext = vim.fn.expand("%:e")
	return filepath .. "." .. ext
end

require("nvim-autopairs").setup({
	fast_wrap = {},
	disable_filetype = { "TelescopePrompt", "vim" },
})

local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { file_path, git_info },
		lualine_x = { lsp_info, "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("gitsigns").setup({
	signs = {
		add = { hl = "DiffAdd", text = "+", numhl = "GitSignsAddNr" },
		change = { hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr" },
		delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" },
		topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
		changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
	},
})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"typescript",
		"css",
		"html",
		"javascript",
		"typescript",
		"go",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
})

require("Comment").setup({
	toggler = {
		line = "<leader>/",
		-- block = '<leader>}}',
	},
})

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

require("trouble").setup({})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.prettier,
	},
	-- on_attach = function(client, bufnr)
	-- 	if client.supports_method("textDocument/formatting") then
	-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- vim.api.nvim_create_autocmd("BufWritePre", {
	--     group = augroup,
	--     buffer = bufnr,
	--     callback = function()
	--         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
	--         vim.lsp.buf.formatting_sync()
	--     end,
	-- })
	-- 	end
	-- end,
})

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		-- prompt_prefix = "   ",
		-- selection_caret = "  ",
		-- entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
	-- extensions_list = { "themes", "terms" },
})
