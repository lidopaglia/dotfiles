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

-- actual plugins list
use "wbthomason/packer.nvim"

use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
    config = get_config("telescope")
}

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

use { "gruvbox-community/gruvbox", config = get_config("gruvbox") }

-- plugins todo
-- 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
-- 'junegunn/goyo.vim'
-- 'junegunn/limelight.vim'
-- 'junegunn/vim-easy-align'
-- 'kyazdani42/nvim-web-devicons'
-- 'nvim-lua/plenary.nvim'
-- 'nvim-lua/popup.nvim'
-- 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
-- 'nvim-telescope/telescope.nvim'
-- 'preservim/vim-pencil'
-- 'tpope/vim-fugitive'
-- 'tpope/vim-surround'
