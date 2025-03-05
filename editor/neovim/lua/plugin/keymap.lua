-- Have <Esc> work as expected in terminal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlighting.
vim.keymap.set("n", "<leader><leader>", vim.cmd.noh)

-- Close the quickfix and location lists quickly.
vim.keymap.set("n", "<leader>qc", vim.cmd.cclose)
vim.keymap.set("n", "<leader>ql", vim.cmd.lclose)

-- Define mappings to leverage nvim-treesitter-context.
vim.keymap.set("n", "<leader>cc", require("treesitter-context").toggle)
vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end)

-- Define LSP mappings.
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>d", function()
        vim.lsp.buf.definition({ loclist = true })
    end)
vim.keymap.set("n", "<leader>i", function()
        vim.lsp.buf.implementation({ loclist = true })
    end)
vim.keymap.set("n", "<leader>r", function()
        vim.lsp.buf.references(nil, { loclist = true })
    end)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

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

