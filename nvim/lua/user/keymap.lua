-- Keymap opts
local opts = { noremap = true, silent = false }
-- helper function to reduce typing
local keymap = vim.api.nvim_set_keymap

-- helper to do normal mode remapping:
local nmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

-- helper to do visual mode remapping:
local vmap = function(keys, func, desc)
	if desc then
		desc = 'LSP: ' .. desc
	end

	vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
end

-- Go up and down in wrapped lines
nmap('j', 'gjzz', 'Move down wrapped lines')
nmap('k', 'gkzz', 'Move up wrapped lines')


-- Force center on jump to eof
nmap('G', 'Gzz', 'Jump to EOF')
vmap('G', 'Gzz', 'Jump to EOF')


-- Yeet!
nmap('<C-j>', '5gjzz', 'Move down @ 5x speed')
nmap('<C-k>', '5gkzz', 'Move up @ 5x speed')
nmap('<C-h>', '5h', 'Move left @ 5x speed')
nmap('<C-l>', '5l', 'Move right @ 5x speed')

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- buffers
nmap('<leader>w', ':w<CR>', 'Write current buffer')
nmap('<leader>W', ':wa<CR>', 'Write all buffers')
nmap('<leader>q', ':q<CR>', 'Close current buffer')
nmap('<leader>Q', ':qa<CR>', 'Quit')

-- word count
vmap('<leader>wc', 'g<C-g>', '[c]ord [c]ount')
nmap('<leader>wc', 'g<C-g>', '[w]ord [c]ount')

-- File explorer
nmap('<leader>e', ':Neotree toggle left<CR>', 'Toggle file explorer')

-- Toggle hilight search
nmap('<leader>*', ':set hlsearch! hlsearch?<CR>')

-- Redo
nmap("U", '<C-r>', 'Redo')

-- Spelling
nmap("<leader>sh", ":Telescope spell_suggest<CR>", '[s]pelling [h]elp - Telescope spell suggest')
nmap("<leader>sf", "1z=", '[s]pelling [f]ix - Correct the spelling of a word (yolo)')
nmap("<leader>sa", "zG", '[s]pelling [a]dd - adds the word under the cursor to internal-wordlist')
nmap("<leader>sr", "zuG", '[s]pelling [r]emove - remove the word under the cursor to internal-wordlist')
nmap("<leader>au", ":setlocal spell spelllang=en_au",
	'[s]pelling [r]emove - remove the word under the cursor to internal-wordlist')
nmap("<leader>us", ":setlocal spell spelllang=en_us<CR>",
	'[s]pelling [r]emove - remove the word under the cursor to internal-wordlist')

-- Useful telescopes...
nmap("<leader>ct", ":Telescope colorscheme<CR>", 'Telescope colorscheme')
nmap("<leader>fh", ":Telescope find_files hidden=true no_ignore=true<CR>", 'Telescope find files')
nmap("<leader>ff", ":Telescope fd<CR>", 'Telescope fd')
nmap("<leader>fa", ":Telescope live_grep<CR>", 'Telescope live grep')
nmap("<leader>T", ":Telescope<CR>", 'Telescope')
nmap('ref', require('telescope.builtin').lsp_references, 'Go to references')

-- Git commit info
nmap("<leader>hh", ":GitMessenger<CR>", "GitMessenger")

-- Code navigation
nmap('<leader>h', vim.diagnostic.goto_prev, 'Go to previous error/warning')
nmap('<leader>l', vim.diagnostic.goto_next, 'Go to next error/warning')
nmap('dec', vim.lsp.buf.declaration, 'Go to declaration')
nmap('def', vim.lsp.buf.definition, 'Go to definition')
nmap('imp', vim.lsp.buf.implementation, 'Go to implementation')

-- Help
nmap('K', vim.lsp.buf.hover, 'Hover documentation')
nmap('sig', vim.lsp.buf.signature_help, 'Signature Documentation')
nmap('type', vim.lsp.buf.type_definition, 'Type Definition')

-- Refactor
nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
-- nmap("ca", vim.lsp.buf.code_action, 'code actions')
nmap("<leader>ca", vim.cmd.RustLsp('codeAction'), '[c]ode [a]ction')

-- Source init.lua
nmap('<leader>g', ':source ~/.config/nvim/init.lua<CR>', 'Source init file')

--minimap

local map = require('mini.map')
nmap('<Leader>mc', map.close)
nmap('<Leader>mf', map.toggle_focus)
nmap('<Leader>mm', map.open)
nmap('<Leader>mr', map.refresh)
nmap('<Leader>ms', map.toggle_side)
nmap('<Leader>mt', map.toggle)

local symbols = map.gen_encode_symbols.dot('3x2')
map.setup({
	symbols = {
		encode = symbols
	},
	integrations = {
		map.gen_integration.builtin_search(),
		map.gen_integration.diagnostic(),
	},
})
