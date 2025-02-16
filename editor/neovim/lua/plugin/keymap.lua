-- Have <Esc> work as expected in terminal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlighting.
vim.keymap.set("n", "<leader><leader>", vim.cmd.noh)

-- Close the quickfix and location lists quickly.
vim.keymap.set("n", "<leader>cc", vim.cmd.cclose)
vim.keymap.set("n", "<leader>lc", vim.cmd.lclose)

-- Define unimpaired-style keybindings for navigating diagnostics.
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-w>d", vim.diagnostic.open_float)

-- Define LSP mappings.
vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ld", function()
        vim.lsp.buf.definition({ loclist = true })
    end)
vim.keymap.set("n", "<leader>li", function()
        vim.lsp.buf.implementation({ loclist = true })
    end)
vim.keymap.set("n", "<leader>lr", function()
        vim.lsp.buf.references(nil, ({ loclist = true }))
    end)
vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action)

-- Define mappings to quickly open neovim config files.
vim.keymap.set("n", "<leader><leader>c",
    function()
        vim.cmd.edit(vim.env.MYVIMRC)
    end)
vim.keymap.set("n", "<leader><leader>k",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/plugin/keymap.lua")
    end)
vim.keymap.set("n", "<leader><leader>p",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins.lua")
        vim.fn.search("require(\"lazy\").setup")
    end)

-- Define mappings to quickly open shell config files.
vim.keymap.set("n", "<leader><leader>z",
    function()
        vim.cmd.edit("~/.zshrc")
    end)
vim.keymap.set("n", "<leader><leader>b",
    function()
        vim.cmd.edit("~/.bashrc")
    end)

