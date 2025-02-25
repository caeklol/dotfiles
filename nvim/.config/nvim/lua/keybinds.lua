vim.g.mapleader = "\\"

-- primeagen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- code actions
vim.keymap.set('n', '<leader>ca', function()
	vim.lsp.buf.code_action({apply=true})
end, bufopts)
