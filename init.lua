-- lido.nvim
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true

-- make comments italic
vim.api.nvim_set_hl(0, "Comment", { italic = true })

-- make backgrounds transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

-- config
require("config.lsp")
require("config.lazy")
