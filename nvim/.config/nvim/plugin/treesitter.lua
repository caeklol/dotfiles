local treesitter = require('nvim-treesitter')

treesitter.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "go", "rust", "bash", "highlight", "html" },

  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
