local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git", "clone", "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  execute "packadd packer.nvim"
end

-- initialize and configure packer
local packer = require("packer")
packer.init {
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0 -- the amount in ms that a plugins load time must be over for
  -- it to be included in the profile
}
local use = packer.use
packer.reset()

-- Begin plugins
use "wbthomason/packer.nvim"

-------------------------------------------------------------------------------
-- NAVIGATION
-------------------------------------------------------------------------------

-- File Tree
--use({
--  "kyazdani42/nvim-tree.lua",
--  requires = 'kyazdani42/nvim-web-devicons',
--  config = get_config("nvim-tree")
--})

-- Telescope
use({
  "nvim-telescope/telescope.nvim",
  module = "telescope",
  cmd = "Telescope",
  requires = {
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  config = get_config("telescope"),
})


use { "nvim-telescope/telescope-file-browser.nvim" }
use { 'nvim-telescope/telescope-ui-select.nvim' }
use { 'cljoly/telescope-repo.nvim' }

-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
use { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    'j-hui/fidget.nvim'
  },
  config = get_config("mason"),
}

use { -- Autocompletion
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
}

-- vscode-like pictograms
use 'onsails/lspkind-nvim'

-- Use Neovim as a language server to inject
-- LSP diagnostics, code actions, and more via Lua
use 'jose-elias-alvarez/null-ls.nvim'

-- LSP UIs
use 'glepnir/lspsaga.nvim'

use { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  run = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end,
  config = get_config("treesitter"),
}

use { -- Additional text objects via treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
}


-------------------------------------------------------------------------------
-- TEXT
-------------------------------------------------------------------------------
--use({ "kylechui/nvim-surround", tag = "*", config = get_config("surround") })

-- Add indentation guides even on blank lines
use 'lukas-reineke/indent-blankline.nvim'

-- "gc" to comment visual regions/lines
use { 'numToStr/Comment.nvim', config = get_config("comment"), }

-------------------------------------------------------------------------------
-- THEME & APPEARANCE
-------------------------------------------------------------------------------

-- Icons
use "kyazdani42/nvim-web-devicons"

-- Gruvbox
use({ "gruvbox-community/gruvbox", config = get_config("gruvbox") })

-- Zen Mode
use {
  "folke/zen-mode.nvim",
  config = get_config("zen-mode")
}

-- Lualine
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  config = get_config('lualine')
}

-- barbar
use {
  'romgrk/barbar.nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = get_config('barbar')
}

---- Sessions
--use({ "shatur/neovim-session-manager",
--  config = get_config("session"),
--  requires = { "nvim-telescope/telescope.nvim" }
--})

-- gitsigns
use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = get_config("gitsigns"),
  tag = 'release' -- To use the latest release
}


use 'ap/vim-css-color'

use 'windwp/nvim-autopairs'

use { 'junegunn/goyo.vim' }
use { 'junegunn/limelight.vim' }
use { 'preservim/vim-pencil' }
use { 'hashivim/vim-terraform' }
