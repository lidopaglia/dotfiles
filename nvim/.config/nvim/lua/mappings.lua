local map = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", default_options)
vim.g.mapleader = " "

map("n", "gf", ":edit <cfile><cr>", default_options) -- Allow gf to open non-existent files
-- nnoremap <leader>e :edit ~/.config/nvim/init.vim<cr>
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



