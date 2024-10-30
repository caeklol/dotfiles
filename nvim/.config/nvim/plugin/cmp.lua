local cmp = require('cmp')

cmp.setup({
	formatting = {
		format = require('lspkind').cmp_format({
		  mode = 'symbol',
		  maxwidth = 50,
		  ellipsis_char = '...',
		  show_labelDetails = true,

		  before = function (entry, vim_item)
			return vim_item
		  end
		}),
	},
	snippet = {
		expand = function(args)
		require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({}),
	sources = {
		{ name='nvim_lsp' },
		{ name='luasnip' },
	},
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format()
  }
}
