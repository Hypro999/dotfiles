" Core settings.
set backspace=indent,eol,start
set clipboard=unnamedplus
set completeopt=longest,menuone,noinsert
set encoding=utf-8
set hidden
set ignorecase
set laststatus=0
set linebreak
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

syntax enable
filetype plugin indent on

" Configure plugins (requires junegunn/vim-plug).
call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-unimpaired'
	Plug 'tpope/vim-repeat'

	Plug 'tpope/vim-fugitive'

	Plug 'AndrewRadev/linediff.vim'
	Plug 'wesQ3/vim-windowswap'

	Plug 'Hypro999/edge' 

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	if has('nvim')
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

		Plug 'nvim-treesitter/nvim-treesitter'
	endif
call plug#end()

" Set colorscheme.
set termguicolors
colorscheme edge

" Configure vim-airline.
let g:airline_theme='deus'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#checks=[]
let g:airline#extensions#tabline#formatter='unique_tail'

" Configure vim-commentary.
autocmd FileType c,cpp setlocal commentstring=//\ %s
autocmd FileType sql setlocal commentstring=--\ %s

" Make escape work as expected when using terminal mode.
tnoremap <Esc> <C-\><C-n>

" Add faster keybinding for write/save.
nnoremap <silent> <leader>w :w <CR>

" Add faster keybinding for quit (force).
nnoremap <silent> <leader>q :q! <CR>

" Add keybinding to trim trailing whitespace.
nnoremap <silent> <leader><space> :silent! %s/\s\+$//g<CR>

" Add keybinding to format JSON through jq.
nnoremap <silent> <leader>jq :%!jq<CR>

" Add keybindings for window/pane swapping through vim-windowswap.
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

" Add keybindings for nvim-telescope.
if has('nvim')
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif

" Make opening the vim/nvim config file super easy.
function! OpenEditorConfig()
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
nnoremap <silent> <leader>c :call OpenEditorConfig()<CR>

" Make opening the zshrc config file super easy.
nnoremap <silent> <leader>z :e! ~/.zshrc<CR>

" Make opening the tmux config file super easy.
nnoremap <silent> <leader>t :e! ~/.tmux.conf<CR>

" Enable syntax highlighting through nvim-treesitter.
if has('nvim')
lua<< EOF
	require'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true
		}
	}
EOF
endif
