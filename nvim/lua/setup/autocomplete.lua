local cmp = require 'cmp'
local lspkind = require("lspkind")

cmp.setup {
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs( -4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        max_width = 50,
        symbol_map = { Copilot = "" }
      })
    },
    sources = {
	{ name = "copilot", group_index = 2 },
        { name = 'nvim_lsp' },
    },
}
