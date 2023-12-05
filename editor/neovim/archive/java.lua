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

-- Update these variables as needed:
local jdtls_jar_path = '~/.eclipse/jdt-language-server-1.7.0/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar'
local jdtls_config_path = '~/eclipse/jdt-language-server-1.7.0/config_linux'
local jdtls_workspaces_dir = '~/.eclipse/jdt-language-server-1.7.0/workspaces/' 

local get_jdtls_workspace_dir = function()
	local p = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
	return jdtls_workspaces_dir .. p
end

local jdtls_settings = 
lspconfig.jdtls.setup {
	on_attach = init_keybinds,
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-noverify',
		'-Xms1G',
		'-jar',
		jdtls_jar_path,
		'-configuration',
		jdtls_config_path,
		'-data',
		get_jdtls_workspace_dir()
	},
	settings = {
		java = {
			errors = {
				incompleteClasspath = {
					severity = 'ignore'
				}
			}
		}
	},
	flags = {debounce_text_changes = 150}
}
