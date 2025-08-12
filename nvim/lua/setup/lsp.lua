-- live reload lsp settings
require("neoconf").setup({
	-- override any of the default settings here
})



local lspconfig = require("lspconfig")

-- rustaceanvim (mutex with rust-analyzer)
-- rust language server
-- lspconfig.rust_analyzer.setup({
-- 	settings = {
-- 		['rust-analyzer'] = {},
-- 	},
-- })

-- lua language server
lspconfig.lua_ls.setup({})

-- astro
lspconfig.astro.setup({})

-- python language server
lspconfig.pyright.setup {}

lspconfig.ts_ls.setup {
	on_attach = function(client)
		-- Don't format with giga tabs for the love of fuck!
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}

-- lspconfig.cssls.setup {}
local prettier = require("prettier")

prettier.setup({
	bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescrip.tsx",
		"typescriptreact",
		"yaml",
	},
	cli_options = {
		config_precedence = "cli-override",
		-- '--single-quote',
		-- '--jsx-single-quote',
		-- '--trailing-comma=all',
		-- '--print-width=100',
		-- '--tab-width=2',
		-- '--use-tabs=false',
	},
})
