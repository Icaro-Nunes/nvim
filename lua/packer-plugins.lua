-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'Mofiqul/vscode.nvim'

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use ("rbong/vim-flog")

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {
      'akinsho/flutter-tools.nvim',
      requires = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
  }

  use {'mfussenegger/nvim-dap',
  requires = {
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local dap = require("dap")

    -- setup mason and ensure cpptools is installed
    require("mason").setup()
    require("mason-nvim-dap").setup({
      ensure_installed = {'cpptools'}
    })

    -- setup cpptools adapter
    dap.adapters.cpptools = {
      type = 'executable';
      name = "cpptools",
      command = vim.fn.stdpath('data') .. '/mason/bin/OpenDebugAD7',
      args = {},
      attach = {
        pidProperty = "processId",
        pidSelect = "ask"
      },
    }

    -- this configuration should start cpptools and the debug the executable main in the current directory when executing :DapContinue
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "cpptools",
        request = "launch",
        program = '${workspaceFolder}/out/m',
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {"<", "${workspaceFolder}/cases/case"} ,
        runInTerminal = false,
      },
    }
  end,
}

use "rcarriga/nvim-dap-ui"

end)
