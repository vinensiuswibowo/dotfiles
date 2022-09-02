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
  use({ "folke/tokyonight.nvim" })
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
  use({ "b3nj5m1n/kommentary" })
  use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })
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
  use({ "tpope/vim-fugitive" })
  use({ "windwp/nvim-spectre" })
  use({ 'phaazon/hop.nvim', branch = 'v2' })
  use({ 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
  use({ "NvChad/nvterm" })
  use({ "akinsho/git-conflict.nvim", tag = "*", config = function()
    require("git-conflict").setup()
  end, })
end)
