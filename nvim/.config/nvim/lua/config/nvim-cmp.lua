-- https://github.com/jdhao/nvim-config/blob/448f2394fe393cc1514bf8ef3e742ce7f56f9fd1/lua/config/nvim-cmp.lua

-- Setup nvim-cmp.
local cmp = require("cmp")

-- The extensions needed by nvim-cmp should be loaded beforehand
require("cmp_nvim_lsp")
require("cmp_path")

cmp.setup {
  mapping = cmp.mapping.preset.insert {
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = "nvim_lsp" }, -- For nvim-lsp
    { name = "path" }, -- for path completion
  },
}

cmp.setup.filetype("tex", {
  sources = {
    { name = "path" }, -- for path completion
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
})
