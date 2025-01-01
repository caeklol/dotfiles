return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- use 'andweeb/presence.nvim'
  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'RRethy/base16-nvim'
  use {
  	'nvim-treesitter/nvim-treesitter',
  	run = function()
  		local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  		ts_update()
  	end,
  }

end)
