-- live reload lsp settings
require("neoconf").setup({
  -- override any of the default settings here
})

local lspconfig = require("lspconfig")

-- rust language server
lspconfig.rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {},
  },
})

-- lua language server
lspconfig.lua_ls.setup({})

lspconfig.astro.setup({})

-- python language server
lspconfig.pyright.setup{}

