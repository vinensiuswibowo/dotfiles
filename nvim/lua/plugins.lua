local vim = vim;
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
  use({ "wbthomason/packer.nvim" })

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      require("config.lsp-config")
    end
  }
  use 'nvim-tree/nvim-web-devicons'
  use {
    'romgrk/barbar.nvim',
    requires = 'nvim-web-devicons'
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require("config.lualine-config")
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      'L3MON4D3/LuaSnip',
      "hrsh7th/nvim-cmp",
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      require("config.cmp-config")
    end
  }

  use({ "MunifTanjim/nui.nvim" })
  use({ "b3nj5m1n/kommentary" })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("config.blankline")
    end
  })

  use({
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup(require("config.theme"))
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require("telescope").setup(require("config.telescope-config"))
    end
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup(require("config.gitsign-config"))
    end
  })

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
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup(require("config.neotree"))
    end
  }

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup(require("config.whichkey"))
    end
  })

  use({ "tpope/vim-fugitive" })

  use({
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup()
    end
  })

  use({
    'phaazon/hop.nvim',
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

  use({
    "akinsho/git-conflict.nvim",
    tag = "*",
    config = function()
      require("git-conflict").setup()
    end,
  })

  use({
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      require("config.autopairs")
    end
  })

  use({
    "kevinhwang91/nvim-ufo",
    requires = 'kevinhwang91/promise-async',
    config = function()
      require("config.fold-config")
    end
  })

  use({
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.rest-config")
    end
  })

  if is_bootstrap then
    require('packer').sync()
  end
end)


if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
