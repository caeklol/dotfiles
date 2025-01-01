local colorscheme = require('base16-colorscheme')
colorscheme.with_config({
    telescope = true,
    telescope_borders = true,
    cmp = true,
})

vim.cmd('colorscheme base16-gruvbox-dark-hard')
