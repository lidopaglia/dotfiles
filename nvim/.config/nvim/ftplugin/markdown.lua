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
--vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])
--vim.cmd "hi matchURL gui=underline cterm=underline ctermfg=None"

-- grey out for strikethrough
--vim.fn.matchadd("matchStrike", [[[~]\{2}.\+[~]\{2}]])
--vim.cmd "hi matchStrike guifg=gray"

-- Surround markdown link title, using clipboard contents
-- https://github.com/kylechui/nvim-surround/discussions/53#discussioncomment-3134891
--require("nvim-surround").buffer_setup({
--    surrounds = {
--        ["l"] = {
--            add = function()
--                local clipboard = vim.fn.getreg("+"):gsub("\n", "")
--                return {
--                    { "[" },
--                    { "](" .. clipboard .. ")" },
--                }
--            end,
--            find = "%b[]%b()",
--            delete = "^(%[)().-(%]%b())()$",
--            change = {
--                target = "^()()%b[]%((.-)()%)$",
--                replacement = function()
--                    local clipboard = vim.fn.getreg("+"):gsub("\n", "")
--                    return {
--                        { "" },
--                        { clipboard },
--                    }
--                end,
--            },
--        },
--    },
--})
