--
-- BEHOLD.. THE LUA CONFIG
--
require('plugins')
require('keybinds')
require('settings')

local cmd = vim.cmd

-- check if packages installed for portability/stability

cmd('colorscheme base16-monokai')

-- lualine follows theme
require('lualine').setup{
    options = {
        theme = 'base16'
    }
}

cmd('autocmd TermOpen * startinsert')

-- transparency :3
cmd([[
if exists("g:neovide")
    let g:neovide_transparency=0.9
    let g:neovide_cursor_vfx_mode = "sonicboom"
endif
]])

-- fish
cmd([[
if &shell =~# 'fish$'
    set shell=bash
endif
]])

-- local Plug = vim.fn['plug#']
-- 
-- vim.call('plug#begin', '~/AppData/Local/nvim-data/plugged')
-- 
-- Plug 'echasnovski/mini.nvim'
-- 
-- vim.call('plug#end')

-- NOTE
-- Telescope is currently hijacking the default filebrowser
-- I have yet to fully experiment with Netrw + Vinegar setup
