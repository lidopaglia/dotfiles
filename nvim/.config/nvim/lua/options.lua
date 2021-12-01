vim.cmd("filetype indent plugin on")
vim.cmd("highlight Normal guibg=none")
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}")
vim.cmd("colorscheme gruvbox")

vim.opt.number        = true -- enable numbered lines
vim.opt.hidden        = true -- allow switching from unsaved buffer
vim.opt.wrap          = false
vim.opt.encoding      = 'utf-8'
vim.opt.fileencoding  = 'utf-8'
vim.opt.errorbells    = false
vim.opt.termguicolors = true

-- Editing
vim.opt.expandtab   = true    -- Convert tabs to spaces
vim.opt.tabstop     = 2       -- Insert 2 spaces for a tab
vim.opt.smarttab    = true    -- Make tabbing smarter (will realize you have 2 vs 4)
vim.opt.shiftwidth  = 2       -- Use this number of spaces for indentation
vim.opt.smartindent = true    -- Make indenting smart
vim.opt.autoindent  = true    -- Use auto indent
vim.opt.iskeyword:append('-') -- Treat dash separated words as a word text object
vim.opt.virtualedit = 'block' -- Allow going past the end of line in visual block mode
vim.opt.startofline = false   -- Don't position cursor on line start after certain operations
vim.opt.breakindent = true    -- Indent wrapped lines to match line start

-- Search
vim.opt.incsearch = true  -- Show search results while typing
vim.opt.hlsearch  = false

-- History / Undo
vim.opt.undofile = true                                    -- Enable persistent undo
vim.opt.undodir  = vim.fn.expand('$HOME/.cache/nvim-undo') -- Set directory for persistent undo
vim.opt.backup   = false                                   -- Create a backup file
vim.opt.swapfile = false                                   -- Control swapfile creation

vim.opt.scrolloff     = 24 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 12 -- Minimal number of columns to scroll horizontally
vim.wo.colorcolumn    = '80'
--vim.opt.signcolumn = true --err: invalid should be a string?
vim.opt.list = true
--vim.opt.listchars = "tab:➤\ ,trail:·"
vim.opt.cmdheight = 1 -- give more space for messages.

vim.opt.updatetime = 50  -- default 4000 (in ms = 4s). reduce time for highlighting other refs.
vim.opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)

vim.opt.shortmess = vim.opt.shortmess + "c" -- don't pass messages to |ins-completion-menu|.
vim.opt.wildmode = "longest,list,full"

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of the current window

vim.opt.mouse = "a" -- lazy split resizing when needed with mouse
