" Neovim configuration file

au BufNewFile,BufRead,BufReadPost *.c0 set syntax=c
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

nnoremap <leader>ff <cmd>Telescope find_files<cr>

syntax on

let g:python3_host_prog = '/usr/bin/python3'
let g:python2_host_prog = '/usr/bin/python2.7'

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sheerun/vim-polyglot'

Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

Plug 'lervag/vimtex'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'

Plug 'lark-parser/vim-lark-syntax'
call plug#end()

lua << EOF
require('telescope').setup{
	defaults = {
		hidden = true
	}
}
EOF

" if exists('+termguicolors')
" 	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" 	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" 	set termguicolors
" endif

" colorscheme spaceduck

" colorscheme moonfly
colorscheme nightfly
set tabpagemax=20
set scrolloff=5

" Macros for marking tasks on my todo list
let @p = 'A --j'
let @o = 'A -ccj'

" Update todos on save
autocmd BufWritePost .todo silent! !python3.10 ~/Desktop/ao/ap/todo.py
