local present, alpha = pcall(require, 'alpha')

if not present then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- 高亮按钮组
local button = function(...)
  local result = dashboard.button(...)
  result.opts.hl = 'AlphaButtons'
  result.opts.hl_shortcut = ''
  return result
end

local header = {
  '          ▀████▀▄▄              ▄█ ',
  '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
  '    ▄        █          ▀▀▀▀▄  ▄▀  ',
  '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
  '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
  '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
  '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
  '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
  '   █   █  █      ▄▄           ▄▀   ',
}
local buttons = {
  button('r', '📂  Recently files', ':Telescope oldfiles <CR>'),  
  button('f', '🔍  Find file', ':Telescope find_files <CR>'),
  button('p', '📗  Projects', ':Telescope projects <CR>'),
  -- button('n', '  New file', ':ene <BAR> startinsert <CR>'),
  button('t', '📜  Find text', ':Telescope live_grep <CR>'),
  button('e', '💿  Edit Projects', ':edit ~/AppData/Local/nvim-data/telescope_history<CR>'),
  button('q', '🔗  Quit Neovim', ':qa <CR>'),
}
local footer = '👑 ArcturusVirgo 👑'

-- 布局
dashboard.section.header.val = header
dashboard.section.buttons.val = buttons
dashboard.section.footer.val = footer

-- 高亮
dashboard.section.footer.opts.hl = 'AlphaType'
dashboard.section.header.opts.hl = 'AlphaHeader'

require('base46').load_highlight('alpha')
alpha.setup(dashboard.opts)







