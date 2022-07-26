local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

-- REPLACE: cut inner word to "r & replace with last yanked (including system)
-- Or, visually select and p
map("n", ",r", '"rdiwhp', { noremap = true })

-- toggle bool word - true/false
map( "n", "gtb",
  ":lua require('functions').toggle_bool({word=vim.fn.expand('<cword>')})<CR>",
  { noremap = true, silent = true }
)

map("n", "gf", ":edit <cfile><cr>", default_options) -- Allow gf to open non-existent files
map("n", "<leader>T", ":tab new<CR>", default_options)
map("n", "<leader>Q", ":bufdo bdelete<CR>", default_options)
map("n", "<leader>sp", ":setlocal spell! spelllang=en_us<CR>", default_options)
map("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>", default_options)

-- better indenting
map("v", "<TAB>", ">gv", default_options)
map("v", "<S-TAB>", "<gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", default_options)

-- moves lines up and down
map("v", "J", ":move '>+1<CR>gv=gv", default_options)
map("v", "K", ":move '<-2<CR>gv=gv", default_options)
map("i", "<C-j>", "<esc>:m .+1<CR>==", default_options)
map("i", "<C-k>", "<esc>:m .-2<CR>==", default_options)
map("n", "<leader>j", ":m .+1<CR>==", default_options)
map("n", "<leader>k", ":m .-2<CR>==", default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprevious<CR>", default_options)

-- close buffer
map("n", "<leader>d", ":bd<CR>", default_options)
map("n", "<leader><leader>d", ":bd!<CR>", default_options)

-- easier moving between splits
map('n', '<C-j>', '<C-w><C-j>', default_options)
map('n', '<C-K>', '<C-W><C-K>', default_options)
map('n', '<C-L>', '<C-W><C-L>', default_options)
map('n', '<C-H>', '<C-W><C-H>', default_options)

-- undo break points
--inoremap , ,<c-g>u
--inoremap . .<c-g>u
--inoremap ! !<c-g>u
--inoremap ? ?<c-g>u

-- keep search results centered
map("n", "n", "nzzzv", default_options)
map("n", "N", "Nzzzv", default_options)
map("n", "J", "mzJ`z", default_options)

-- yank to end of line.
map("n", "Y", "y$", default_options)

-- copy to system clipboard
map("n", "<leader>c", "\"+y", default_options)
map("v", "<leader>c", "\"+y", default_options)

-- default copy to system clipboard
map("n", "<leader>C", "gg\"+yG", default_options)
map("v", "y", "\"+y", default_options)

--" jumplist action
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- Telescope
map("n", "<leader>e", '<cmd>lua require("telescope.builtin").find_files({ search_dirs = {"~/.config/nvim"}, hidden = true })<cr>', default_options)
map("n", "<leader>a", '<cmd>lua require("telescope.builtin").find_files({ file_ignore_patterns = {".git/"}, hidden = true, follow = true })<cr>', default_options)
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>', default_options)
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>', default_options)
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>', default_options)
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>', default_options)
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>', default_options)
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', default_options)
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>', default_options)
map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', default_options)
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', default_options)

-- LSP
--map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
--map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
--map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
--map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
--map("n", "<leader>ci", "<cmd> lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")

-- renamer
--map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- Switch Sessions
map("n", "<leader>1", ":Telescope sessions [save_current=true]<CR>", default_options)

-- List Repos
map("n", "<leader>2", ":Telescope repo list<CR>", default_options)

-- gitsigns
map("n", "<leader>tb", [[<Cmd>lua require'gitsigns'.toggle_current_line_blame()<CR>]], default_options)

-- markdown
map("v", "<leader>l", [[c[<c-r>"]()<esc>]], { noremap = false })
