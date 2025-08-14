return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc",
                    "json", "yaml", "xml",
                    "python", "java", "go", "haskell"
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>s",
                        node_incremental = "[n",
                        scope_incremental = "[s",
                        node_decremental = "]n"
                    }
                }
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            local context = require("treesitter-context")
            vim.keymap.set("n", "<leader>-", context.toggle)
        end
    },
}
