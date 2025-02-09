-- live reload lsp settings
require("neoconf").setup({
	-- override any of the default settings here
})

local lspconfig = require("lspconfig")

-- rustaceanvim (mutex with rust-analyzer)
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
	"n",
	"<leader>a",
	function()
		vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
		-- or vim.lsp.buf.codeAction() if you don't want grouping.
	end,
	{ silent = true, buffer = bufnr }
)
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ 'hover', 'actions' })
	end,
	{ silent = true, buffer = bufnr }
)
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
		"typescriptreact",
		"yaml",
	},
})
