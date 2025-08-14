return {
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    {
        "wesQ3/vim-windowswap",
        config = function()
            vim.g.windowswap_map_keys = 0
            vim.keymap.set("n", "<leader>wy", vim.fn["WindowSwap#MarkWindowSwap"])
            vim.keymap.set("n", "<leader>wp", vim.fn["WindowSwap#DoWindowSwap"])
            vim.keymap.set("n", "<leader>ww", vim.fn["WindowSwap#EasyWindowSwap"])
        end
    },
}
