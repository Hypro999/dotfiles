-- Have <Esc> work as expected in terminal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlighting.
vim.keymap.set("n", "<leader>h", vim.cmd.noh)

-- Close the current buffer.
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete)

-- Print absolute path of the current buffer.
vim.keymap.set("n", "<leader>fp", function() print(vim.api.nvim_buf_get_name(0)) end)

-- Bookmarks to important config files.
vim.keymap.set("n", "<leader>1",
    function()
        vim.cmd.edit(vim.env.MYVIMRC)
    end)
vim.keymap.set("n", "<leader>2",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/keybinds.lua")
    end)
vim.keymap.set("n", "<leader>3",
    function()
        vim.cmd.edit(vim.fn.stdpath("config") .. "/lua/plugins.lua")
        vim.fn.search('require("lazy").setup')
    end)
