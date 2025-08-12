-- Relative line numbers
-- NOTE: must be done before NeoTree
vim.cmd [[set number relativenumber]]

-- Open file explorer
-- vim.cmd[[Neotree]]
-- Set colorscheme

vim.cmd [[colorscheme cyberdream]]

-- Autofmt on save
-- vim.cmd [[au BufWritePre * lua vim.lsp.buf.format()]]

-- Use clipboard for yank
vim.cmd [[set clipboard=unnamedplus]]

-- 1 line command line ()
vim.cmd [[set cmdheight=1]]

-- Miss me with your hlsearch
vim.cmd [[set nohlsearch]]

vim.filetype.add({
	extension = {
		astro = "astro",
	}
})
-- require("groovy").setup()
