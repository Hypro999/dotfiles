-- Have <Esc> work as expected in terminal mode.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Clear search highlighting.
vim.keymap.set("n", "<leader><leader>", vim.cmd.noh)

-- Close the quickfix and location lists quickly.
vim.keymap.set("n", "<leader>qc", vim.cmd.cclose)
vim.keymap.set("n", "<leader>ql", vim.cmd.lclose)

-- Close the current buffer.
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- Print absolute path of the current buffer.
vim.keymap.set("n", "<leader>fp", function() print(vim.api.nvim_buf_get_name(0)) end)

