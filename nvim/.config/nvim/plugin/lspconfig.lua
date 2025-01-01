local lspconfig = require('lspconfig')

function add_lsp(server, options)
	if not options["cmd"] then
		options["cmd"] = server["document_config"]["default_config"]["cmd"]
	end

	if not options["capabilities"] then
		options["capabilities"] = require("cmp_nvim_lsp").default_capabilities()
	end

	if vim.fn.executable(options["cmd"][1]) == 1 then
		server.setup(options)
	end
end

add_lsp(lspconfig.bashls, {})
add_lsp(lspconfig.gopls, {})
add_lsp(lspconfig.gopls, {})
add_lsp(lspconfig.lua_ls, {})
add_lsp(lspconfig.rust_analyzer, {})
