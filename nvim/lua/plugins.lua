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
  use({ "ellisonleao/gruvbox.nvim" })
  use({ "folke/tokyonight.nvim" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "MunifTanjim/nui.nvim" })
  use({ "lewis6991/gitsigns.nvim" })
  use({ "williamboman/nvim-lsp-installer" })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  })
  use({ "b3nj5m1n/kommentary" })
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use({ "folke/which-key.nvim" })
  use({ "tpope/vim-fugitive" })
  use({ "windwp/nvim-spectre" })
  use({ 'phaazon/hop.nvim', branch = 'v2' })
  use({
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        float = {
          relative = 'editor',
          row = 0.3,
          col = 0.25,
          width = 0.5,
          height = 0.4,
          border = "tranparent",
        },
        horizontal = { location = "rightbelow", split_ratio = .3, },
        vertical = { location = "rightbelow", split_ratio = .5 },
      })
    end
  })
  use({ "akinsho/git-conflict.nvim", tag = "*", config = function()
    require("git-conflict").setup()
  end, })

  use({ "neovim/nvim-lspconfig" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "hrsh7th/nvim-cmp" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "rafamadriz/friendly-snippets" })
  use({ "windwp/nvim-autopairs" })
  use({ "lukas-reineke/indent-blankline.nvim" })
end)
