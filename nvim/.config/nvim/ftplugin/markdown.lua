-- markdown ftplugin

vim.opt_local.colorcolumn = "101"
vim.opt_local.autoindent = true
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.conceallevel = 0

-- spell is not staying local for some reason
-- have to set nospell in other fts that are opened after a markdown
vim.opt_local.spell = true

-- match and underline hyperlinks
vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
vim.cmd "hi matchURL gui=underline cterm=underline ctermfg=None"

-- grey out for strikethrough
vim.fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
vim.cmd "hi matchStrike guifg=gray"

