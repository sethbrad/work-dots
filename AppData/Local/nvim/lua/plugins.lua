--
-- PLUGINS
--
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'RRethy/nvim-base16'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'

Plug 'glepnir/dashboard-nvim'
Plug 'ahmedkhalf/project.nvim'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug ('neoclide/coc.nvim', { branch = 'release' })

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'

Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'ThePrimeagen/vim-be-good'

-- Plug 'RishabhRD/popfix'
-- Plug 'RishabhRD/nvim-cheat.sh'
Plug 'folke/which-key.nvim'

Plug 'vimwiki/vimwiki'
-- Plug 'nvim-neorg/neorg'
Plug 'hrsh7th/nvim-cmp'

Plug 'hkupty/iron.nvim'

Plug 'dag/vim-fish'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mboughaba/i3config.vim'

-- diy plugin playground
-- Plug 'C:/Users/zvm5w1b/repos/MakeCharBlob'

vim.call('plug#end')

--
-- INITIALIZATION
--
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {'node_modules', '.git', '.idea', 'dist'}
    },
    extensions = {
        file_browser = {
            hijack_netrw = true
        },
        ['ui-select'] = {
            require('telescope.themes').get_dropdown{}
        }
    }
}
require('telescope').load_extension('projects')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('ui-select')

require('gitsigns').setup{}
require('project_nvim').setup{}
require('nvim-web-devicons').setup{}
require('which-key').setup{}

-- lualine
require('lualine').setup{
    sections = {
        lualine_c = {},
        lualine_x = {'filetype'}
    }
}

-- treesitter
require('nvim-treesitter.configs').setup {
    -- these have to be explicitly enabled
    ensure_installed = {
        "go",
        "c",
        "javascript",
        "typescript",
        "lua",
        "java",
    },
    highlight = {
        enable = true
    }
}

-- bufferline
require('bufferline').setup {
    options = {
        mode = 'tabs'
    }
}

-- neorg
-- require('neorg').setup {
--     load = {
--         ["core.defaults"] = {},
--         ["core.norg.dirman"] = {
--             config = {
--                 workspaces = {
--                     work = "~/notes/work",
--                 }
--             }
--         },
--         -- ["core.norg.concealer"] = {},
--         ["core.norg.completion"] = {
--             config = {
--                 engine = "nvim-cmp"
--             }
--         },
--         ["core.export"] = {}
--     }
-- }

-- nvim-cmp
local cmp = require('cmp')

cmp.setup {
    sources = cmp.config.sources {
        sources = 'neorg'
    }
}

-- dashboard
local db = require('dashboard')

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

-- iron
local iron = require("iron.core")

iron.setup {
    config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
            sh = {
                command = {"zsh"}
            }
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require('iron.view').bottom(40),
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
        italic = true
    }
}

