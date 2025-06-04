return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{
			  "mason-org/mason.nvim", opts = {
				  PATH = "append"
			  },
			},
			"neovim/nvim-lspconfig",
		},
	},
	{ "j-hui/fidget.nvim" , opts = {} },
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },
	{ "hrsh7th/cmp-path", lazy = true },
  	{
  	  "hrsh7th/nvim-cmp",
  	  name = "nvim-cmp",
  	  event = "VeryLazy",
  	  config = function()
  	    require("config.nvim-cmp")
  	  end,
  	},
}
