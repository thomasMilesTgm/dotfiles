require("lazy").setup({
	-- Emacs style command help
	"folke/which-key.nvim",

	-- Configure Neovim with JSON
	-- Global settings here `~/.config/nvim/neoconf.json`
	-- Project specific settings can be changed by adding `.neoconf.json` to a directory
	{ "folke/neoconf.nvim",    cmd = "Neoconf", config = true },

	-- Lua LSP & Helpful neovim plugin tools
	"folke/neodev.nvim",

	-- buck2 buildifier
	{
		dir = "~/code/monorepo/buck2/support/buildifier", -- Change if you have monorepo somewhere weird
		requires = { "nvimtools/none-ls.nvim" },
	},
	{
		"nvimtools/none-ls.nvim", -- actually loaded using require("null-ls")
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("null-ls").setup({
				sources = {
					require('none-ls-buildifier'),
				},
			})
		end,
	},
	-- Colorscheme
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
	-- Tab bar
	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	-- rustaceanvim
	{
		'mrcjkb/rustaceanvim',
		version = '^5', -- Recommended
		lazy = false, -- This plugin is already lazy
	},

	-- hex/rgb color previews
	'norcalli/nvim-colorizer.lua',

	-- prettier
	"MunifTanjim/prettier.nvim",

	-- Icons
	"nvim-tree/nvim-web-devicons",

	-- minimap
	{ 'echasnovski/mini.nvim', version = '*' },
	-- Pretty status line
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	-- LSP overlay
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup {
				-- options
				progress = {
					display = {
						-- How to format a progress notification group's name
						-- format_group_name = function(group)
						--    return "groupname:" .. tostring(group)
						-- end,
						-- How to format a progress annotation
						--- @param msg { title: string }
						format_annote = function(msg)
							local out = string.gsub(msg.title, "cd %S+/monorepo && ", "")
							-- trim to max characters, with ellipsis
							local max = 50
							if #out > max then
								out = string.sub(out, 1, max - 3) .. "..."
							end
							return out
						end,
					},
				}
			}
		end,
	},
	-- Comment lines
	{
		'numToStr/Comment.nvim',
		opts = {
			toggler = {
				---Line-comment toggle keymap
				line = 'cl', --comment line(s)
				---Block-comment toggle keymap
				block = 'gl',
			},
			opleader = {
				---Line-comment keymap
				line = 'cl',
				---Block-comment keymap
				block = 'gl',
			},
		},
		lazy = false,
	},
	-- cursorline
	{
		'tummetott/reticle.nvim',
		event = 'VeryLazy', -- optionally lazy load the plugin
		opts = {
			-- add options here if you wish to override the default settings
		},
	},
	-- Pretty colors for comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			signs = true, -- show icons in the signs column
			sign_priority = 8, -- sign priority
			-- keywords recognized as todo comments
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "⌖ ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "🕮 ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
			gui_style = {
				fg = "NONE", -- The gui style to use for the fg highlight group.
				bg = "BOLD", -- The gui style to use for the bg highlight group.
			},
			merge_keywords = true, -- when true, custom keywords will be merged with the defaults
			-- highlighting of the line containing the todo comment
			-- * before: highlights before the keyword (typically comment characters)
			-- * keyword: highlights of the keyword
			-- * after: highlights after the keyword (todo text)
			highlight = {
				multiline = true,
				multiline_pattern = "^.",
				multiline_context = 10,
				before = "",
				keyword = "wide",
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]],
				comments_only = true, -- uses treesitter to match keywords in comments only
				max_line_len = 400, -- ignore lines longer than this
				exclude = {}, -- list of file types to exclude highlighting
			},
			-- list of named colors where we try to extract the guifg from the
			-- list of highlight groups or use the hex color if hl not found as a fallback
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" }
			},
			search = {
				command = "rg",
				args = {
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
				},
				-- regex that will be used to match keywords.
				-- don't replace the (KEYWORDS) placeholder
				pattern = [[\b(KEYWORDS):]], -- ripgrep regex
				-- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
			},
		}
	},

	-- auto complete
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind.nvim',

	-- Auto-bracketing
	{ "windwp/nvim-autopairs",   config = function() require("nvim-autopairs").setup {} end },

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5', -- or, branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	{ 'akinsho/bufferline.nvim', version = "v4.4.1",                                        dependencies = 'nvim-tree/nvim-web-devicons' },

	-- Aesthetic --
	'mechatroner/rainbow_csv',
	'EdenEast/nightfox.nvim',
	'fenetikm/falcon',
	'bluz71/vim-nightfly-guicolors',
	'folke/tokyonight.nvim',
	'rcarriga/nvim-notify',
	{
		'catppuccin/nvim',
		as = 'catppuccin',
	},
	{
		'bluz71/vim-moonfly-colors', as = 'moonfly'
	},
	'folke/lsp-colors.nvim',
	'savq/melange-nvim',
	'lukas-reineke/indent-blankline.nvim',

	-- Git
	'rhysd/git-messenger.vim',


	-- Copilot --
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				server_opts_overrides = {
					trace = "verbose",
					settings = {
						advanced = {
							listCount = 10, -- #completions for panel
							inlineSuggestCount = 3, -- #completions for getCompletions
						}
					},
				}
			})
		end,
	},

	-- Auto complete support
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},

	-- Lualine support
	{ 'AndreM222/copilot-lualine' },


})
-- enable bufferline
vim.opt.termguicolors = true
-- require("bufferline").setup {}
require('Comment').setup()
require('reticle').setup()

local mm = require('mini.map')
local diagnostic_integration = mm.gen_integration.diagnostic({
	error = 'DiagnosticFloatingError',
	warn  = 'DiagnosticFloatingWarn',
	info  = 'DiagnosticFloatingInfo',
	hint  = 'DiagnosticFloatingHint',
})
mm.setup({
	integrations = {
		diagnostic_integration,
		mm.gen_integration.diff(),
		mm.gen_integration.builtin_search()
	}
})

require("cyberdream").setup({
	-- Enable transparent background
	transparent = true,

	-- Enable italics comments
	italic_comments = false,

	-- Replace all fillchars with ' ' for the ultimate clean look
	hide_fillchars = true,

	-- Modern borderless telescope theme
	borderless_pickers = true,

	-- Set terminal colors used in `:terminal`
	terminal_colors = true,

	opts = {
		variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
		highlights = {
			-- Highlight groups to override, adding new groups is also possible
			-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

			-- Example:
			-- Comment = { fg = "#696969", bg = "NONE", italic = true },

			-- Complete list can be found in `lua/cyberdream/theme.lua`
		},

		-- Override a highlight group entirely using the color palette
		-- overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
		-- 	-- Example:
		-- 	return {
		-- 		Comment = { fg = colors.green, bg = "NONE", italic = true },
		-- 		["@property"] = { fg = colors.magenta, bold = true },
		-- 	}
		-- end,

		-- Override a color entirely
		-- colors = {
		-- 	-- For a list of colors see `lua/cyberdream/colours.lua`
		-- 	-- Example:
		-- 	bg = "#000000",
		-- 	green = "#00ff00",
		-- 	magenta = "#ff00ff",
		-- },
	},

	-- Disable or enable colorscheme extensions
	extensions = {
		telescope = true,
		notify = true,
	},
})
