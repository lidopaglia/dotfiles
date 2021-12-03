local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

map("n", "gf", ":edit <cfile><cr>", default_options) -- Allow gf to open non-existent files
map("n", "<leader>e", ":edit ~/.config/nvim/init.lua<cr>", default_options)

-- Switch Session
map("n", "<leader>1", ":Telescope sessions [save_current=true]<CR>", default_options)

-- nnoremap <leader>T :tab new<CR>
-- nnoremap <leader>N :tab new<CR>
-- nnoremap <leader>Q :bufdo bdelete<cr>
-- nnoremap <leader>W :q<CR>
-- nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
-- nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

-- moves lines up and down
map("v", "J", ":move '>+1<CR>gv=gv", default_options)
map("v", "K", ":move '<-2<CR>gv=gv", default_options)
map("i", "<C-j>", "<esc>:m .+1<CR>==", default_options)
map("i", "<C-k>", "<esc>:m .-2<CR>==", default_options)
map("n", "<leader>j", ":m .+1<CR>==", default_options)
map("n", "<leader>k", ":m .-2<CR>==", default_options)

-- undo break points
--inoremap , ,<c-g>u
--inoremap . .<c-g>u
--inoremap ! !<c-g>u
--inoremap ? ?<c-g>u

-- keep search results centered
map("n", "n", "nzzzv", default_options)
map("n", "N", "Nzzzv", default_options)
map("n", "J", "mzJ`z", default_options)

--" yank to end of line.
map("n", "Y", "y$", default_options)

--" copy to system clipboard
map("n", "<leader>c", "\"+y", default_options)
map("v", "<leader>c", "\"+y", default_options)

--" default copy to system clipboard
map("n", "<leader>C", "gg\"+yG", default_options)
map("v", "y", "\"+y", default_options)

--" jumplist action
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- Telescope
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>', default_options)
--map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
--map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
--map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
--map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
--map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
--map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
--map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
--map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>', default_options)
--map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
--map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
--map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
--map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
--map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
--map("n", "<leader>ci", "<cmd> lua vim.lsp.diagnostic.show_line_diagnostics()<cr>")

