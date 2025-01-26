-- Define mappings to enable quickly opening neovim config files.
vim.keymap.set("n", "<leader>c",
	function()
		vim.cmd.edit(vim.env.MYVIMRC)
	end)
vim.keymap.set("n", "<leader>k",
	function()
		vim.cmd.edit(vim.fn.stdpath("config") .. "/plugin/keymap.lua")
	end)
vim.keymap.set("n", "<leader>p",
	function()
		vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins.lua")
		vim.fn.search("require(\"lazy\").setup")
	end)

-- Define mappings to enable quickly opening shell config files.
vim.keymap.set("n", "<leader>z",
	function()
		vim.cmd.edit("~/.zshrc")
	end)
vim.keymap.set("n", "<leader>b",
	function()
		vim.cmd.edit("~/.bashrc")
	end)

