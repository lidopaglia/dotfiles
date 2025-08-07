-- lido.nvim
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.cmd.colorscheme("habamax")

-- shade comments and set italic
vim.api.nvim_set_hl(0, "Comment", { fg = "#666666", italic = true })

-- make backgrounds transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

-- thinner borders
vim.api.nvim_set_hl(0, "VertSplit", { fg = "#444444", bg = "NONE", nocombine = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#444444", bg = "NONE" })

-- shade the indent symbol
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#666666" })

-- config
require("config.lsp")
require("config.lazy")
