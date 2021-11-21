" init.vim

" Get Plugged
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'gruvbox-community/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'junegunn/goyo.vim'
Plug 'junegunn/lightline.vim'
Plug 'junegunn/vim-easy-align'

"Plug 'godlygeek/tabular'
"Plug 'mbbill/undotree'

call plug#end()

let mapleader ="\<space>"

colorscheme gruvbox
highlight Normal guibg=none
filetype plugin indent on


nnoremap <leader>N :tab new<CR>
nnoremap <leader>Q :bufdo bdelete<cr>
nnoremap <leader>W :q<CR>
nnoremap <leader>o :setlocal spell! spelllang=en_us<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" moves lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" yank to end of line. u not like the others?
nnoremap Y y$

" copy to system clipboard
nnoremap <leader>c "+y
vnoremap <leader>c "+y
nnoremap <leader>C gg"+yG
" default copy to system clipboard
vnoremap y "+y

" jumplist action
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" wtf is this?
vnoremap <leader>p "_dP

lua require("lido")

nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending <CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END


" Start interactive EasyAlign in visual mode (e.g. vipga)
"xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" Goyo Stuffs
"function! s:goyo_enter()
"  let b:quitting = 0
"  let b:quitting_bang = 0
"  autocmd QuitPre <buffer> let b:quitting = 1
"  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
"endfunction
"
"function! s:goyo_leave()
"  " Quit Vim if this is the only remaining buffer
"  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
"    if b:quitting_bang
"      qa!
"    else
"      qa
"    endif
"  endif
"endfunction

"autocmd! User GoyoEnter call <SID>goyo_enter()
"autocmd! User GoyoLeave call <SID>goyo_leave()
"nnoremap <Leader>g :Goyo \| set linebreak<CR>

" Do I want this? 
" usefule when editing .md with wrap on...
" noremap <silent> k gk
" noremap <silent> j gj
" noremap <silent> 0 g0
" noremap <silent> $ g$

" prob just want this for .md only (setlocal)?
" https://vim.fandom.com/wiki/Move_cursor_by_display_lines_when_wrapping
" noremap <silent> <Leader>w :call ToggleWrap()<CR>
" function ToggleWrap()
"   if &wrap
"     echo "Wrap OFF"
"     setlocal nowrap
"     set virtualedit=all
"     silent! nunmap <buffer> <Up>
"     silent! nunmap <buffer> <Down>
"     silent! nunmap <buffer> <Home>
"     silent! nunmap <buffer> <End>
"     silent! iunmap <buffer> <Up>
"     silent! iunmap <buffer> <Down>
"     silent! iunmap <buffer> <Home>
"     silent! iunmap <buffer> <End>
"     silent! nunmap j gj
"     silent! nunmap k gk
"     silent! nunmap 0 g0
"     silent! nunmap $ g$
"   else
"     echo "Wrap ON"
"     setlocal wrap linebreak nolist
"     set virtualedit=
"     setlocal display+=lastline
"     noremap  <buffer> <silent> <Up>   gk
"     noremap  <buffer> <silent> <Down> gj
"     noremap  <buffer> <silent> <Home> g<Home>
"     noremap  <buffer> <silent> <End>  g<End>
"     inoremap <buffer> <silent> <Up>   <C-o>gk
"     inoremap <buffer> <silent> <Down> <C-o>gj
"     inoremap <buffer> <silent> <Home> <C-o>g<Home>
"     inoremap <buffer> <silent> <End>  <C-o>g<End>
"     noremap <silent> j gj
"     noremap <silent> k gk
"     noremap <silent> 0 g0
"     noremap <silent> $ g$
"   endif
" endfunction
"
"

