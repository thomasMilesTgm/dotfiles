-- Relative line numbers
-- NOTE: must be done before NeoTree
vim.cmd[[set number relativenumber]]
-- Open file explorer
-- vim.cmd[[Neotree]]
-- Set colorscheme
vim.cmd[[colorscheme carbonfox]]
-- Autofmt on save
vim.cmd [[au BufWritePre * lua vim.lsp.buf.format()]]
-- Use clipboard for yank
vim.cmd[[set clipboard=unnamedplus]]
-- Center cursor
vim.cmd[[set scrolloff=30]]
-- 2 line command line
vim.cmd[[set cmdheight=2]]
-- Miss me with your hlsearch
vim.cmd[[set nohlsearch]]
