-- Open important files quickly.
vim.keymap.set("n", "<leader>1",
    function()
        vim.cmd.edit(vim.env.MYVIMRC)
    end)
vim.keymap.set("n", "<leader>2",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/plugin/keymap")
    end)
vim.keymap.set("n", "<leader>3",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins.lua")
        vim.fn.search('require("lazy").setup')
    end)

