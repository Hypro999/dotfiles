" Core settings.
set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt=longest,menuone,noinsert
set encoding=utf-8
set hidden
set ignorecase
set laststatus=0
set mouse=a
set nohlsearch
set nowrap
set number
set relativenumber
set shiftwidth=4
set shortmess=Ic
set smartcase
set splitbelow
set splitright
set tabstop=4
set whichwrap=<,>,[,]

if has('win32') || has('win64')
	set belloff=all
	set clipboard=unnamed
	set nobackup
	set nowritebackup
endif

syntax enable
filetype plugin indent on

" Make opening the vim/nvim config file super easy.
function! Config()
	let l:vimrc = ''
	if has('win32') || has('win64')
		if has('nvim')
			let l:vimrc = '~/AppData/Local/nvim/init.vim'
		else
			let l:vimrc = '~/_vimrc'
		endif
	else
		if has('nvim')
			let l:vimrc = '~/.config/nvim/init.vim'
		else
			let l:vimrc = '~/.vimrc'
		endif
	endif
	execute 'e! ' . l:vimrc
endfunction
nnoremap <silent> <leader>c :call Config()<CR>

" Make escape work as expected when using terminal mode.
tnoremap <Esc> <C-\><C-n>

" Make it easier to move between panes.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Faster keybinds for write/save.
nnoremap <silent> <leader>s :w <CR>
nnoremap <silent> <leader>w :w <CR>

" Faster keybind for quit (force).
nnoremap <silent> <leader>q :q! <CR>

" Keybind for trimming trailing whitespace.
nnoremap <silent> <leader><space> :silent! %s/\s\+$//g<CR>

" Alias vres to vertical res.
cnoreabbrev <expr> vres 'vertical res'

" :h <space> would autocomplete the command for opening help in a new tab.
cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab help' : 'h'

" Configure plugins (requires junegunn/vim-plug).
call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
	Plug 'AndrewRadev/linediff.vim'

	Plug 'sainnhe/edge'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	if has('nvim')
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	endif
call plug#end()

" Colorscheme.
set termguicolors
colorscheme edge

" Configure vim-commentary.
autocmd FileType c,cpp,cuda setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s

" Configure vim-airline.
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks=[]
let g:airline#extensions#tabline#formatter='unique_tail'

" Command to format JSON automatically.
" Requires the jq command line tool to be on PATH.
nnoremap <silent> <leader>jq :%!jq<CR>

" Neovim specific configuration using lua.
if has('nvim')
lua << 	EOF
	-- nvim-telescope
	vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true })
	vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true })
EOF
endif
