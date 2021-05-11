" init.vim

" Get Plugged
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))

Plug 'mbbill/undotree'
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/goyo.vim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader =" "

colorscheme gruvbox
highlight Normal guibg=none

filetype plugin indent on

" Goyo Stuffs
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
nnoremap <Leader>g :Goyo \| set linebreak<CR>

nnoremap <Leader>N :tab new<CR>
nnoremap <Leader>W :q<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>o :setlocal spell! spelllang=en_us<CR>

" moves lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


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
