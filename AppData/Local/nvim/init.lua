--
-- BEHOLD.. THE LUA CONFIG
--
require('plugins')
require('keybinds')
require('settings')

local cmd = vim.cmd

cmd('colorscheme base16-monokai')

-- theme airline as well?
-- cmd('AirlineTheme base16')

cmd('autocmd TermOpen * startinsert')

-- NOTE
-- Telescope is currently hijacking the default filebrowser
-- I have yet to fully experiment with Netrw + Vinegar setup
