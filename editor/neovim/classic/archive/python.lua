-- Requirements:

--     Neovim >=5.0.
--     Python >=3.6.
--     The neovim/nvim-lspconfig plugin.
--     Run pip install python-lsp-server pyls-isort python-lsp-black pyls-flake8 pylsp-mypy.

-- Installation:

--     Copy the contents of python.lua to after/plugin/python.lua.

-- Notes:

--     :help rtp if you don't know what after is or where it goes.
--     TDLR; the after directory is parallel to where you keep your init.vim/init.lua file.
--
-- If you have node installed and can install pyright, then prefer that over
-- pylsp. The only real use case for preferring pylsp is when you don't have
-- node installed.


local lspconfig = require('lspconfig')

local init_keybinds = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local keybinds = {
		['K'] = 'vim.lsp.buf.hover()',
		['<F2>'] = 'vim.lsp.buf.rename()',
		['<F12>'] = 'vim.lsp.buf.definition()',
		['<S-F12>'] = 'vim.lsp.buf.references()',
		['<leader>f'] = 'vim.lsp.buf.formatting()',
		['<leader>e'] = 'vim.diagnostic.open_float()',
		['[d'] = 'vim.diagnostic.goto_prev()',
		[']d'] = 'vim.diagnostic.goto_next()'
	}

	for seq, action in pairs(keybinds) do
		buf_set_keymap('n', seq, string.format('<Cmd>lua %s<CR>', action), {noremap=true, silent=true})
	end

	-- Set up omnifunc for manual auto complete with <C-x><C-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lspconfig.pylsp.setup {
	on_attach = init_keybinds,
	settings = {
		plugins = {
			pylsp_mypy = {
				live_mode = false
			}
		}
	},
    flags = {debounce_text_changes = 150}
}
