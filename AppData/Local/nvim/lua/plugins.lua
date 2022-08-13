--
-- PLUGINS
--
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/AppData/Local/nvim-data/plugged')

Plug 'RRethy/nvim-base16'
Plug 'nvim-lualine/lualine.nvim'
Plug 'alvarosevilla95/luatab.nvim'

Plug 'glepnir/dashboard-nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug('neoclide/coc.nvim', { branch = 'release' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'

Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'ThePrimeagen/vim-be-good'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'vimwiki/vimwiki'

vim.call('plug#end')

--
-- INITIALIZATION
--
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {'node_modules', '.git', '.idea', 'dist'}
    }
}
require('telescope').load_extension('projects')
require('telescope').load_extension('session-lens')

require('gitsigns').setup{}
require('project_nvim').setup {}
require('nvim-web-devicons').setup{}
require('luatab').setup{}

-- treesitter
require('nvim-treesitter.configs').setup{
    -- these have to be explicitly enabled
    ensure_installed = { "c", "javascript", "typescript", "rust", "lua", "java" },

    highlight = {
        enable = true
    }
}

-- sessions
require('session-lens').setup {
    path_display={'shorten'},
}

-- dashboard
local db = require('dashboard')

-- db.custom_header = {
--  '                                                       ',
--  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
--  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
--  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
--  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
--  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
--  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
--  '                                                       ',
--  '                                                       '
-- }

db.custom_header = {
    '⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣴⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⣿⣛⢻⡿⢛⡙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢹⣻⣾⡷⠸⠇⣼⣿⡄⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⠀⢸⢿⣍⣤⣶⠟⢻⡟⣷⠀⠀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⠀⠀⣤⡟⠀⠈⠁⠀⠀⠈⢿⣿⣧⡀⠀⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⢀⣾⡿⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣆⠀⠀⠀⠀',
    '⠀⠀⠀⠀⠀⣾⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣄⠀⠀⠀',
    '⠀⠀⠀⠀⣼⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀',
    '⠀⠀⠀⢀⠟⢿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀',
    '⠀⡔⠒⠋⠀⠀⢻⣶⣄⠀⠀⠀⠀⠀⠀⠀⣶⣿⣿⣿⠟⠆⠀⠀',
    '⠀⣹⠀⠀⠀⠀⠀⢻⡟⠀⠀⠀⠀⠀⢀⣴⣿⠟⠛⠃⠀⠈⣀⠄',
    '⠰⠿⣴⣄⣄⣀⣀⣢⣿⣶⣦⣴⣶⣾⣿⣿⣿⢀⣠⣤⠴⠚⠁⠀',
    '⠀⠀⠀⠀⠉⠙⠛⠿⠛⠁⠀⠀⠀⠀⠀⠘⠻⠿⠛⠁⠀⠀⠀⠀',
    '                        '
}

db.custom_center = {
    {
        desc = 'Find a project          ',
        shortcut = 'SPC f p'
    },
    {
        desc = 'Edit my config          ',
        shortcut = 'SPC e c'
    },
    {
        desc = 'Blank buffer            ',
        shortcut = 'SPC e e'
    }
}

db.custom_footer = {
    '                               ',
    "<== Seth's custom config :3 ==>"
}

