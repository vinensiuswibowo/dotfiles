-- Only required if you have packer configured as `opt`
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
-- 	group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
-- 	callback = function()
-- 		vim.opt.foldmethod = "expr"
-- 		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 	end,
-- })
--

vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim", module = "plenary" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "navarasu/onedark.nvim" })
	use({ "shaunsingh/nord.nvim" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" })
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	-- use({ "numToStr/Comment.nvim", module = "Comment", keys = { "gc", "gb" } })
  use({ "b3nj5m1n/kommentary" })
	use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "rafamadriz/friendly-snippets", module = "cmp_nvim_lsp", event = "InsertEnter" })
	use({ "hrsh7th/nvim-cmp", after = "friendly-snippets" })
	use({ "L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })
	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
	use({ "windwp/nvim-autopairs", after = "nvim-cmp" })
	use({ "folke/which-key.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "tpope/vim-fugitive" })
end)
