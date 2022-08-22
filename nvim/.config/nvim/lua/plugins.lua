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
    threshold = 0  -- the amount in ms that a plugins load time must be over for
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
use({
  "kyazdani42/nvim-tree.lua",
  requires = 'kyazdani42/nvim-web-devicons',
  config = get_config("nvim-tree")
})

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
use "neovim/nvim-lspconfig"

-------------------------------------------------------------------------------
-- THEME
-------------------------------------------------------------------------------

-- Icons
use({ 'kyazdani42/nvim-web-devicons' })

-- Gruvbox
use({ "gruvbox-community/gruvbox", config = get_config("gruvbox") })

-------------------------------------------------------------------------------
-- LAYOUT
-------------------------------------------------------------------------------

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
  requires = {'kyazdani42/nvim-web-devicons'},
  config = get_config('barbar')
}

-- Sessions
use({ "shatur/neovim-session-manager",
  config = get_config("session"),
  requires = { "nvim-telescope/telescope.nvim" }
})

-- gitsigns
use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = get_config("gitsigns"),
  tag = 'release' -- To use the latest release
}

-- Comment
use {
  'numToStr/Comment.nvim',
  config = get_config("comment"),
}

use 'ap/vim-css-color'

use {'junegunn/goyo.vim'}
use {'junegunn/limelight.vim'}
use {'preservim/vim-pencil'}
use {'tpope/vim-surround'}
use {'jiangmiao/auto-pairs'}
use {'hashivim/vim-terraform'}
--use {'pprovost/vim-ps1'}
--use {'jeffkreeftmeijer/vim-numbertoggle'}

-- plugins todo
-- 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
-- 'junegunn/vim-easy-align'
-- 'kyazdani42/nvim-web-devicons'
-- 'tpope/vim-fugitive'
