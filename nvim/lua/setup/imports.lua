require("lazy").setup({
  -- Emacs style command help
  "folke/which-key.nvim",

  -- Configure Neovim with JSON
  -- Global settings here `~/.config/nvim/neoconf.json`
  -- Project specific settings can be changed by adding `.neoconf.json` to a directory
  { "folke/neoconf.nvim", cmd = "Neoconf", config=true },

  -- Lua LSP & Helpful neovim plugin tools
  "folke/neodev.nvim",

  -- Icons
  "nvim-tree/nvim-web-devicons",

  -- Pretty status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5', -- or, branch = '0.1.x',
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
  {'akinsho/bufferline.nvim', version = "v4.4.1", dependencies = 'nvim-tree/nvim-web-devicons'},

  -- Aesthetic --
  'mechatroner/rainbow_csv',
  'EdenEast/nightfox.nvim',
  'fenetikm/falcon',
  'bluz71/vim-nightfly-guicolors',
  'folke/tokyonight.nvim',
  'rcarriga/nvim-notify',
  { 'catppuccin/nvim',
    as = 'catppuccin', },
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
    config = function ()
      require("copilot_cmp").setup()
    end
  },

  -- Lualine support
  { 'AndreM222/copilot-lualine' },


})
-- enable bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}
require('Comment').setup()
require('reticle').setup {}
