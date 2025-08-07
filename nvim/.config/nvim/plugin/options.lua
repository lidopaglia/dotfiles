-- options
-------------------------------------------------------------------------------

-- numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- extra
vim.opt.mouse = "a"
vim.opt.errorbells = false
vim.opt.title = true
vim.opt.winborder = "rounded"

-- columns
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- wrap
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.inccommand = "split"
vim.opt.linebreak = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- scroll
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 12

-- tabs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("$XDG_CACHE_HOME/nvim/undodir")
vim.opt.undofile = true

-- whitespace
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
