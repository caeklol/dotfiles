-- primeagen
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- lsp
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.hover, bufopts)

vim.keymap.set('n', 'K', function()
    vim.diagnostic.open_float(nil, { focus = false })
end, bufopts)

vim.keymap.set('n', '<leader>ca', function()
	vim.lsp.buf.code_action({apply=true})
end, bufopts)

vim.keymap.set('n', '<leader>re', function()
	vim.lsp.buf.rename()
end, bufopts)

-- ctrl + / comment
local comment = require('Comment.api');
vim.keymap.set("n", "<C-_>", comment.toggle.linewise.current)

local esc = vim.api.nvim_replace_termcodes(
	'<ESC>', true, false, true
)

vim.keymap.set('x', '<C-_>', function()
	vim.api.nvim_feedkeys(esc, 'nx', false)
	comment.toggle.linewise(vim.fn.visualmode())
end)
