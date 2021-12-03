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
    threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
}
local use = packer.use
packer.reset()

-- Begin plugins
use "wbthomason/packer.nvim"

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
use({ "nvim-telescope/telescope-file-browser.nvim" })

-- Gruvbox
use({ "gruvbox-community/gruvbox", config = get_config("gruvbox") })

-- Sessions
use({ "shatur/neovim-session-manager",
  config = get_config("session"),
  requires = { "nvim-telescope/telescope.nvim" }
})

-- plugins todo
-- 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
-- 'junegunn/goyo.vim'
-- 'junegunn/limelight.vim'
-- 'junegunn/vim-easy-align'
-- 'kyazdani42/nvim-web-devicons'
-- 'preservim/vim-pencil'
-- 'tpope/vim-fugitive'
-- 'tpope/vim-surround'
