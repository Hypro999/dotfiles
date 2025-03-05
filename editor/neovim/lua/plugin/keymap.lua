-- Core Key Mappings
-- For key mappings that depend on a certain plugin, refer to `plugins.lua`.

-- Have <Esc> work as expected in terminal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlighting.
vim.keymap.set("n", "<leader><leader>", vim.cmd.noh)

-- Close the quickfix and location lists quickly.
vim.keymap.set("n", "<leader>qq", function()
        vim.cmd.cclose()
        vim.cmd.lclose()
    end)

-- Open up the treesitter AST for the current buffer.
vim.keymap.set("n", "<leader>tt", function()
        vim.treesitter.inspect_tree({ command = "topleft 60vnew" })
    end)

-- Define LSP mappings.
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>d", function()
        vim.lsp.buf.definition({ loclist = true })
    end)
vim.keymap.set("n", "<leader>i", function()
        vim.lsp.buf.implementation({ loclist = true })
    end)
vim.keymap.set("n", "<leader>rr", function()
        vim.lsp.buf.references(nil, { loclist = true })
    end)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)

-- Define mappings to quickly open core neovim config files.
vim.keymap.set("n", "<leader>1",
    function()
        vim.cmd.edit(vim.env.MYVIMRC)
    end)
vim.keymap.set("n", "<leader>2",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/plugin/keymap.lua")
    end)
vim.keymap.set("n", "<leader>3",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins.lua")
        vim.fn.search('require("lazy").setup')
    end)

