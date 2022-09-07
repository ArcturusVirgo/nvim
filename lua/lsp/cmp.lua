-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = require("keybindings").cmp(cmp),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

