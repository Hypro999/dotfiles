-- Start neovim with a blank screen.
vim.opt.shortmess = "Ic"

-- Display relative line numbers.
vim.opt.number = true
vim.opt.relativenumber = true

-- Configure search settings.
--   * Disable highlighting search results.
--   * Default to case insensitive searching unless we use uppercase characters.
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Control where new splits are opened by default.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- When wrapping text, break at the word boundary.
vim.opt.linebreak = true

-- Use the system clipboard by default for all operations, if possible.
if vim.fn.has("clipboard") then
	vim.opt.clipboard = "unnamedplus"
end

-- Define mappings to enable quickly opening certain config files.
vim.keymap.set("n", "<Leader>c",
	function()
		vim.cmd.edit( "~/.config/nvim/init.lua")
	end)
vim.keymap.set("n", "<Leader>z",
	function()
		vim.cmd.edit("~/.zshrc")
	end)
vim.keymap.set("n", "<Leader>b",
	function()
		vim.cmd.edit("~/.bashrc")
	end)

