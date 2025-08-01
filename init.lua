-- lido.nvim
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")

-- make comments italic
vim.api.nvim_set_hl(0, "Comment", { italic = true })

-- Make comments a dim gray instead of white
vim.api.nvim_set_hl(0, "Comment", { fg = "#666666", italic = true })

-- make backgrounds transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

-- config
require("config.lsp")
require("config.lazy")
