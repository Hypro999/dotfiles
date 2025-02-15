-- Start Neovim with a blank screen.
vim.opt.shortmess = "Ic"

-- Display relative line numbers.
vim.opt.relativenumber = true

-- Configure search settings.
--   * Disable highlighting search results.
--   * Default to case insensitive searching unless we use uppercase characters.
-- vim.opt.hlsearch = false
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

-- Disable the unnecessary Neovim providers.
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Use lazy.nvim for plugin management.
--
-- lazy.nvim is pretty parasitic. It takes over the standard startup process.
-- But it's a good parasite (so, it's a symbiont?).
--
-- Normally, following `:help startup`, the vimrc (this file) is sourced during
-- Step 7 and plugins would loaded in Step 10. But by calling our
-- bootstrap/config script for lazy.nvim, which in turn calls the `setup`
-- function from the lazy.nvim lua module, we can distrupt the natural startup
-- process. This is when the symbiont that is lazy.nvim begins its work.
--
-- It basically sets `vim.go.loadplugins` to false which disables step 10
-- entirely. Instead, lazy.nvim will then *mimic* the things that Neovim would
-- normally do (e.g. basically call `:runtime! plugin/**/*.{vim,lua}` but take
-- into account `/after`).
--
-- This is why we can't just stick the bootstrap/config script in `plugin/`,
-- it's because lazy.nvim needs to take over the process, otherwise it would
-- end up loading our bootstrap file which would load lazy.nvim again
-- (resulting in an annoying error message, but no loop because `setup` from
-- lazy.nvim has a countermeasure).
require("plugins")

