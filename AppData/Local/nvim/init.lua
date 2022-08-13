--
-- BEHOLD.. THE LUA CONFIG
--
require('plugins')
require('keybinds')
require('settings')

local cmd = vim.cmd

cmd('colorscheme base16-monokai')

-- lualine follows theme
require('lualine').setup{
    options = {
        theme = 'base16'
    }
}

cmd('autocmd TermOpen * startinsert')
