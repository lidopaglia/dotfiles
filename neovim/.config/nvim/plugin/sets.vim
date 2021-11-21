set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" history / undo
set noswapfile
set nobackup
set undodir=~/.cache/nvim-undo
set undofile

set incsearch
set termguicolors
set scrolloff=24
set colorcolumn=80
set signcolumn=yes
"set isfname+=@-@

set list
set listchars=tab:➤\ ,trail:·

" Give more space for messages.
set cmdheight=1

" default is 40000 (in ms = 4s)
" reduce time for highlighting other references
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set wildmode=longest,list,full

set splitbelow splitright
