-- View the treesitter AST for the current buffer.
vim.keymap.set("n", "<leader>tt", function()
        vim.treesitter.inspect_tree({ command = "topleft 60vnew" })
    end)

