local vim = vim;

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
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "MunifTanjim/nui.nvim" })
  use({ "b3nj5m1n/kommentary" })
  use({ "lukas-reineke/indent-blankline.nvim", config = function()
    require("config.blankline")
  end })

  use({ "folke/tokyonight.nvim", config = function()
    require("tokyonight").setup(require("config.theme"))
  end })

  use({
    "nvim-telescope/telescope.nvim", config = function()
      require("telescope").setup(require("config.telescope-config"))
    end
  })

  use({ "lewis6991/gitsigns.nvim", config = function()
    require("gitsigns").setup(require("config.gitsign-config"))
  end })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup(require("config.treesitter"))
    end
  })

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup(require("config.neotree"))
    end
  }

  use({ "folke/which-key.nvim", config = function()
    require("which-key").setup(require("config.whichkey"))
  end })

  use({ "tpope/vim-fugitive" })

  use({
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
    end
  })

  use({ 'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require("hop").setup({ keys = 'etovxqpdygfblzhckisuran' })
    end
  })

  use({
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup(require("config.terminal"))
    end
  })

  use({ "akinsho/git-conflict.nvim", tag = "*", config = function()
    require("git-conflict").setup()
  end, })


  use({ "williamboman/nvim-lsp-installer", config = function()
    require("config.lsp-installer")
  end })

  use({ "neovim/nvim-lspconfig", config = function()
    require("config.lsp-config")
  end })

  use({ "rafamadriz/friendly-snippets", module = { "cmp", "cmp_nvim_lsp" }, event = "InsertEnter" })

  use({ "hrsh7th/nvim-cmp", after = "friendly-snippets",
    config = function()
      require("config.cmp-config")
    end,
  })

  use({ "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("config.luasnip-config")
    end,
  })

  use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = function()
    require("config.autopairs")
  end })

  use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })
  use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })
  use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })
  use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-path", after = "cmp-buffer" })
  use({ "hrsh7th/cmp-cmdline", after = "cmp-path" })

  use({ "kevinhwang91/nvim-ufo", requires = 'kevinhwang91/promise-async', config = function()
    require("config.fold-config")
  end })

  use({ "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" }, config = function()
    require("config.rest-config")
  end })

  use({ 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })

end)
