--
-- EDITOR SETTINGS
--
local opt = vim.opt
local cmd = vim.cmd

-- opt.autochdir = true
opt.mouse = 'a'
opt.termguicolors = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true

opt.smartcase = true
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = false

opt.colorcolumn = '81'
opt.wrap = false
opt.scrolloff = 10

opt.number = true
opt.guifont = 'FiraCode NF:h10.5'

opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- NETRW SETTINGS FOR WITHOUT VINEGAR
cmd([[
    let g:netrw_liststyle = 3
    let g:netrw_browse_split = 4

    let g:netrw_winsize = 15
]])
