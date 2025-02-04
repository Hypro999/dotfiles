-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:append(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- Basic/Essential Functionality
		{ "tpope/vim-repeat" },
		{ "tpope/vim-surround" },
		{ "tpope/vim-unimpaired" },
		{
			"wesQ3/vim-windowswap",
			config = function()
				vim.g.windowswap_map_keys = 0
				vim.keymap.set("n", "<leader>y", vim.fn["WindowSwap#MarkWindowSwap"])
				vim.keymap.set("n", "<leader>p", vim.fn["WindowSwap#DoWindowSwap"])
				vim.keymap.set("n", "<leader>w", vim.fn["WindowSwap#EasyWindowSwap"])
			end
		},

		-- Theme
		{
			"rebelot/kanagawa.nvim",
			config = function()
				vim.cmd.colorscheme("kanagawa")
			end
		},
		{
			 "nvim-lualine/lualine.nvim",
			 config = function()
				require("lualine").setup()
			 end,
			 dependencies = { "nvim-tree/nvim-web-devicons" }
		},

		-- Advanced
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				local builtin = require("telescope.builtin")
				vim.keymap.set("n", "<leader>ff", builtin.find_files)
				vim.keymap.set("n", "<leader>fg", builtin.live_grep)
				vim.keymap.set("n", "<leader>fb", builtin.buffers)
				vim.keymap.set("n", "<leader>fh", builtin.help_tags)
			end
		},
		{
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("nvim-treesitter.configs").setup({
					highlight = {
						enable = true
					}
				})
			end
		}
	}
})


