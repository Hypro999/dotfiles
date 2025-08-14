-- Start Neovim with a blank screen.
vim.opt.shortmess = "Ic"

-- Display relative line numbers.
-- But show the absolute line number for current line.
vim.opt.number = true
vim.opt.relativenumber = true

-- By default, stick to indentation with 4 spaces.
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Configure search settings.
-- Default to case insensitive searching unless we use uppercase characters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Control where new splits are opened by default.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- When wrapping text, break at the word boundary.
vim.opt.linebreak = true

-- Configure how completion works.
-- Don't insert the suggestion until explicitly selected.
-- Always show the completion menu, even if there's only one option.
vim.opt.completeopt = { "noinsert", "menuone" }

-- Use the system clipboard by default for all operations, if possible.
if vim.fn.has("clipboard") then
    vim.opt.clipboard = "unnamedplus"
end

-- Disable the unnecessary Neovim providers.
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Apply custom keybinds.
require("keybinds")

-- Use lazy.nvim for plugin management.
--
-- See:
-- 1. `:help startup`
-- 2. `:help lazy.nvim-🚀-usage-▶️-startup-sequence`
-- for the implications of doing this.
-- lazy.nvim takes over the Neovim startup sequence.
--
-- Normally, the vimrc (this file) is sourced during Step 7 of startup and
-- plugins would be loaded in Step 10. But by calling our bootstrap/config
-- script for lazy.nvim, which in turn calls the `setup` function from the
-- lazy.nvim lua module, we will distrupt the remainder of the normal
-- startup process.
--
-- lazy.nvim basically sets `vim.go.loadplugins` to false which disables
-- Step 10 entirely. Instead, lazy.nvim will then mimic the things that
-- Neovim would normally do.
--
-- This is why we can't just stick the bootstrap/config script in `plugin/`.
-- It's because lazy.nvim needs to take over the process. Otherwise, what
-- happens is that Neovim will load all plugins which will load lazy.nvim
-- which will then try to load all plugins which will result in lazy.nvim
-- trying to load itself and then we get into an infinite loop (which is
-- broken by a check performed in lazy.nvim, but this results in a warning
-- message during startup).
require("plugins")
