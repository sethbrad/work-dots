-- 
-- KEYBINDS
--
local map = vim.api.nvim_set_keymap

vim.cmd("let mapleader = ' '")

options = { noremap = true }

-- quick change config
map('n', '<leader>ec', '<cmd>edit ~/AppData/Local/nvim/init.lua<cr>', options)
map('n', '<leader>sc', '<cmd>luafile %<cr>', options)

-- explorer
map('n', '<leader>t', '<cmd>Vex<cr>', options)
map('n', '<leader>cd', '<cmd>cd %/..<cr>', options)

-- saving/exit
map('n', '<C-s>', '<cmd>w<cr>', options)
map('i', '<C-s>', '<Esc><cmd>w<cr>', options)
map('n', '<M-w>', '<cmd>q<cr>', options)
map('n', '<leader>ca', '<cmd>qa<cr>', options)

map('n', '<leader>ee', '<cmd>enew<cr>', options)

-- terminal
map('t', '<Esc>', "<C-\\><C-n>", options)

-- telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
map('n', '<leader>fp', '<cmd>Telescope projects<cr>', options)

-- cheatsheet
map('n', '<leader>cs', '<cmd>Cheat<cr>', options)

-- split navigation
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)

